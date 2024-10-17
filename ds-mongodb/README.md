# MongoDB

## Installing the chart

0. Install the scripts in the `k8s-utils` directory if you haven't already (use `. install.sh`).

1. Copy `secret.example.env` to `secret.env` and edit the file to change the root account password.  Then, invoke the following to create the `ds-mariadb` Kubernetes secret:
  ```bash
  env2secret ds-mariadb secret.env > templates/secret.yaml
  ```

2. Install the chart dependecies using `helm dependency update`.

3. Edit `values.yaml` to set the host mount size and path, and uncomment the `volumePermissions` block (this is necessary only when creating the persistent volume for the first time and can be commented out again later).

4. Install the chart using `. install.sh`.

> [!NOTE]
> The contents of `secret.env` is used only to initialise the database server for the first time (i.e. the host mount is still empty).

## GUI client: Compass

Since MongoDB's official GUI client [Compass](https://www.mongodb.com/products/tools/compass) is a desktop rather than web application, it must be installed on the client machine.  It can be obtained [here](https://www.mongodb.com/try/download/compass).

### Logging in as the root user

The connection string for the root user is of the form
```
mongodb://root:password@HOSTNAME:32002/?authSource=admin&tls=false
```
where `password` is your root account password and `32002` is the nodePort as set in `values.yaml`. Note that `authSource` refers to the *home* database under which the user was created, but users can also be granted permissions to other databases; in this case, the home database for the root user is `admin`.

![](readme_img/compass_login.png)

### Creating a new user

Open a shell for your logged-in root user by hovering the cursor over the connection in the sidebar and clicking on the `>_` icon that appears:

![](readme_img/compass_addUser.png)

Enter the following (for the `test` database, change as desired). Use Shift+Enter to insert newlines, and Enter to execute the two commands:

```js
use test

db.createUser({
    user: "MyTest",
    pwd: passwordPrompt(),
    roles: [{role: "readWrite", db: "test"}]
})
```

The connection string for the new user is of the form
```
mongodb://MyTest:********@HOSTNAME:32002/?authSource=test&tls=false
```
Note that the `authSource` is now `test` instead of `admin` as for the root user.

For the full official documentation, see [here](https://www.mongodb.com/docs/manual/tutorial/create-users/).

## Backup and restore

See the [official documentation](https://www.mongodb.com/docs/manual/core/backups/#back-up-with-mongodump) for `mongodump` and `mongorestore`.
