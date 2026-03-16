https://www.qt.io/product/qt6/qml-book/ch02-start-app-types

https://doc.qt.io/qt-6/gettingstarted.html

# cmake

```cmake
cmake_minimum_required(VERSION 3.16)

project(helloworld VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# for compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

# for build/.gitignore
if(NOT PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  file(
    GENERATE
    OUTPUT ${PROJECT_BINARY_DIR}/.gitignore
    CONTENT "*")
endif()

find_package(Qt6 REQUIRED COMPONENTS Widgets)

qt_standard_project_setup()

qt_add_executable(helloworld
    widget.cpp
    main.cpp
)

target_link_libraries(helloworld PRIVATE Qt6::Widgets)

set_target_properties(helloworld PROPERTIES
    WIN32_EXECUTABLE ON
    MACOSX_BUNDLE ON
)
```

# clangd

```yml title="clangd"
CompileFlags:
  Remove:
    - "-mno-direct-extern-access"
  Add:
    - "-I/usr/include/qt6"
    - "-I/usr/include/qt6/QtGui"
    - "-I/usr/include/qt6/QtCore"
    - "-I/usr/include/qt6/QtWidgets"
```

# helloworld

https://note.com/noabou/n/n362f2b164341

https://doc.qt.io/qt-6/ja/cmake-get-started.html

https://github.com/jasondegraw/Qt-CMake-HelloWorld
