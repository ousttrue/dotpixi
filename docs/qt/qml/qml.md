https://doc.qt.io/qt-6/qtqml-index.html

# host

https://www.slideshare.net/slideshow/yoctodistro/64976596

## cmake

```cmake
target_link_libraries(${TARGET_NAME} PRIVATE 
  Qt6::Gui 
  Qt6::Qml
  Qt6::QuickControls2
)
```

## QQmlApplicationEngine

- [ROS講座117 QtQuick(qml)を使う](https://qiita.com/srs/items/33195ff2a8db1edee779)
- [QQmlApplicationEngine と QtQuick2ApplicationViewer(QQuickView) の違い](https://hideoku.hatenablog.jp/entry/2016/08/14/232818)

## pyside-qml

https://doc.qt.io/qtforpython-6/tools/pyside-qml.html

https://doc.qt.io/qtforpython-6/examples/example_qml_tutorials_extending-qml_chapter6-plugins.html

## QML Runtime

- https://doc.qt.io/qt-6/ja/qtquick-qml-runtime.html#qml-runtime-tool

```js
import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 400
    height: 400
    visible: true

    Button {
        id: button
        text: "A Special Button"
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            color: button.down ? "#d6d6d6" : "#f6f6f6"
            border.color: "#26282a"
            border.width: 1
            radius: 4
        }
    }
}
```

```sh
> qml hello.qml 
QQmlApplicationEngine failed to load component
hello.qml: Library import requires a version
```

```js
import QtQuick 2.0
```

```sh
QQmlApplicationEngine failed to load component
hello.qml:2:1: module "QtQuick.Controls" is not installed
```

## PyQt 経由

- https://www.qoosky.dev/techs/1779950179/

## plasma widget

## QmlWidget を host する

# QML language

```lua
require("lspconfig").qmlls.setup {}
```

- https://doc.qt.io/qt-6/qmlreference.html
- https://github.com/qt/qtdeclarative

# tooling

https://doc.qt.io/qt-6/qtqml-tooling.html

## language-server

- @2023 [What’s new in QML Language Server (qmlls) shipped with Qt 6.6](https://www.qt.io/blog/whats-new-in-qml-language-server-qmlls-shipped-with-qt-6.6)
- https://doc.qt.io/qt-6/qtqml-tooling-qmlls.html
- https://github.com/qt/qtlanguageserver

### nvim

- https://github.com/neovim/nvim-lspconfig/pull/2551/files
