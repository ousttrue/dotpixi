- [どうすれば setup.py ベースのプロジェクトを近代化できるでしょうか？ - Python Packaging User Guide](https://packaging.python.org/ja/latest/guides/modernize-setup-py-project/)

```toml: title="pyproject.toml"
[build-system]
requires = ["setuptools"]
# setup.py のこと？
build-backend = "setuptools.build_meta"
```

## setuptools.build_meta
