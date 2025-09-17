# basic

- [YAMLについての基本知識 - Qiita](https://qiita.com/xuwenzhen/items/b01f78525626b3e87d23)
- https://codebeautify.org/yaml-to-json-xml-csv

# map

```yml
key: value
```

```json
{
  "key": "value"
}
```

```yml
key: value
key2: value2
key3: [one, two, three]
key4:
  - four
  - five
  - six
```

```json
{
  "key": "value",
  "key2": "value2",
  "key3": ["one", "two", "three"],
  "key4": ["four", "five", "six"]
}
```

# list

```yml
- 1
- 2
```

```json
[1, 2]
```

# multiline text

- @2020 [YAMLで複数行テキストを書きたい時のあれこれ #YAML - Qiita](https://qiita.com/jerrywdlee/items/d5d31c10617ec7342d56)

## write

- @2020 [PyYAMLで改行のある文字列を出力する #Python - Qiita](https://qiita.com/myoshioka/items/99ad0726aa0d2a4b6d31)
