https://www.qt.io/ja-jp/blog/whats-new-for-qml-modules-in-6.5

> 6.5 からは作成したモジュールを qrc:/qt/qml 配下に配置することができます。そしてここに配置されたモジュールは自動的に検出されます

# cmake qt_add_qml_module

```cmake
qt_standard_project_setup(REQUIRES 6.5)

# qrc:/qt/qml/helloqml/main.qml
qt_add_qml_module(helloqmlapp
    URI helloqml
    QML_FILES main.qml 
)
```

