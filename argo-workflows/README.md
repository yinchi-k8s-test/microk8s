# Argo Workflows

This directory contains files for setting up an Argo Workflows instance on our microk8s cluster.

To install the Argo Workflows Helm chart:
```bash
. install.sh
```

This sets up a minimal Argo Workflows installation with a server on port `2746` and authentication disabled.

## Command-line interface

We can install the `argo` CLI on our host machine:

```bash
. install-cli.sh
```

In general, we will only submit workflows in the `argo` namespace, to avoid polluting the other namespaces with completed pods.

- To run the test workflow:
  ```bash
  . test.sh
  ```

- To list all workflows in the `argo` namespace:
  ```bash
  argo list -n argo
  ```

- To obtain the logs for a completed workflow:
  ```bash
  argo logs <workspace-name> -n argo
  ```

- To remove all sucessfully completed workflows in the `argo` namespace:
  ```bash
  argo list -n argo --status Succeeded -o name | xargs -I{} argo delete -n argo {}
  ```

- To remove all completed (including failed) workflows older than one day in the `argo` namespace:
  ```bash
  argo list -n argo --completed --older 1d -o name | xargs -I{} argo delete -n argo {}
  ```

# Python interface (hera)

The `hera` Python package is recommended for interfacing with Argo Workflows.  An example Jupyter notebook is provided in `test/python/dag.ipynb`. (Use `uv sync` to create the virtual environment). Note how `hera` automatically sets up a Python pod for the `echo` script.

Alternatively, the `Container()` function can be used to run a container; see the [official documentation](https://hera.readthedocs.io/en/5.6.0/examples/workflows/dag_diamond_with_callable_container/) for an example of this.
