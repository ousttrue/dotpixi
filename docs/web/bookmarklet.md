```javascript
javascript: (async function () {
  const res = await fetch("http://localhost:8000/let.js", { mode: "cors" });
  const body = await res.text();
  eval(body);
})();
```

# post

## form

```js
// https://qiita.com/ham0215/items/81cc1a2bb0e4832442a3
javascript: (async function () {
  const formdata = new FormData();
  formdata.append("Hello", "World");
  const sned = await fetch("http://localhost:8000", {
    method: "POST",
    mode: "cors",
    body: formdata,
  });
})();
```

## json

```js
// https://qiita.com/ham0215/items/81cc1a2bb0e4832442a3
javascript: (async function () {
  const data = { hello: "world" };
  const sned = await fetch("http://localhost:8000", {
    method: "POST",
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });
  console.log(send);
})();
```

# clipboard

```js
setTimeout(
  () =>
    navigator.clipboard.writeText(
      bar.innerText + "\n" + q.innerText + "\n---\n",
    ),
  500,
);
```
