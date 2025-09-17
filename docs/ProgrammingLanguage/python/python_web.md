# http.server

# WSGI

https://peps.python.org/pep-3333/

## wsgiref

https://docs.python.org/3/library/wsgiref.html

- @2024 [Python で WSGI (Web Server Gateway Interface) に従ったシンプルな Web サーバで Hello World #HelloWorld - Qiita](https://qiita.com/niwasawa/items/69b7393284bce1bfbfe9)
- @2021 `CRUD` [PythonとWSGIで作るToDoリストAPI | Chanomic Blog](https://bombrary.github.io/blog/posts/todo-api-wsgi/)

```py
import wsgiref.simple_server
import wsgiref.types
import logging
import typing


LOGGER = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG)


# wsgiref.types.WSGIApplication
def app(
    env: wsgiref.types.WSGIEnvironment,
    start_response: wsgiref.types.StartResponse,
) -> typing.Iterable[bytes]:
    start_response("200 OK", [("Content-type", "text/plain; charset=utf-8")])
    return [b"Hello, World."]


if __name__ == "__main__":
    host = "localhost"
    port = 8000
    LOGGER.debug("http://%s:%d", host, port)
    httpd = wsgiref.simple_server.make_server(host, port, app)
    httpd.serve_forever()
```

# ASGI

- @2025 [ゼロからFastAPI風のミニフレームワークを実装：ASGIとルーティングを学ぼう｜Leapcell](https://note.com/leapcell/n/n846b64e14477)

# flask

https://flask.palletsprojects.com/en/stable/

- https://flask.palletsprojects.com/en/stable/quickstart/

# FastAPI 

https://fastapi.tiangolo.com/

- @2020 [Python 製 Web フレームワークを Flask から FastAPI に変えた話｜NAVITIME_Tech](https://note.com/navitime_tech/n/nc0381517d067)
- @2024 [FastAPI を使って PC のファイルを別の場所にコピーするだけの無駄機能を作る #Python - Qiita](https://qiita.com/noritakaIzumi/items/8df2bfcb867fa99438b3)

# Tornado

https://www.tornadoweb.org/en/stable/

# bottle

# django
