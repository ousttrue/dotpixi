# qml tool

`/usr/bin/qml`

## tutorial

https://doc.qt.io/qt-6/ja/qtquick-qml-runtime.htm

`qt-6.10` deprecated

```
qt.qml.context: tutorial.qml:38:17 Parameter "cellColor" is not declared. Injection of parameters into signal handlers is deprecated. Use JavaScript functions with formal parameters instead.
```

https://forum.qt.io/topic/130485/injection-of-parameters-into-signal-handlers-is-deprecated-use-javascript-functions-with-formal-parameters-instead

```js
                onClicked: helloText.color = cellColor
// 👇
                onClicked: function (color) {
                    helloText.color = color;
                }
```

## Getting started with Qt Quick applications

https://doc.qt.io/qt-6/qmlapplications.html

- https://code.qt.io/cgit/qt/qtdeclarative.git/tree/examples/quick/layouts?h=6.10
- https://doc.qt.io/qt-6/ja/qmlfirststeps.html



## QtQuick demo

- https://doc.qt.io/qt-6/ja/qtquick-codesamples.html


