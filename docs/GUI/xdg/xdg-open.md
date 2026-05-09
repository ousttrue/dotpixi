- [XDGの設定 | katsyoshi のめもみたいなの](https://blog.katsyoshi.org/blog/2015/02/16/setting-xdg-open/)

```
$ xdg-mime default firefox.desktop text/html
```

```
$ xdg-mime default google-chrome.desktop x-scheme-handler/http
$ xdg-mime default google-chrome.desktop x-scheme-handler/https
```

```
$ xdg-mime default firefox.desktop x-scheme-handler/http
$ xdg-mime default firefox.desktop x-scheme-handler/https
```

`depends on qtpaths in qt5-tools`
