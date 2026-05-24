https://docs.pyinvoke.org/en/stable/

- @2025 [タスクランナーInvokeを使ってみよう #Python - Qiita](https://qiita.com/iisaka51/items/c4888e726356c5474dc4)

## namespace

https://docs.pyinvoke.org/en/stable/concepts/namespaces.html

```py
from invoke import Collection

ns = Collection()
# or: namespace = Collection()
```

- https://here-be-pythons.readthedocs.io/en/latest/project/invoke.html

## tasks module(default)

https://docs.pyinvoke.org/en/stable/concepts/loading.html

> look for a single Python module or package named tasks, and will treat it as the root namespace
