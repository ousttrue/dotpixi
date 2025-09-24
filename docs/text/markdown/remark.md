https://github.com/remarkjs/react-markdown

# unified version

## 10以降

- https://github.com/micromark/micromark/blob/main/packages/micromark-core-commonmark/dev/lib/code-fenced.js

- https://github.com/puruneko/TodoManager/blob/main/src/texteditor/plugin/hashtag/handler.tsx#L193
- https://github.com/lumen-notes/lumen/blob/main/src/remark-plugins/tag.ts

- https://github.com/growilabs/growi/blob/master/packages/remark-growi-directive/src/remark-growi-directive.js
- https://dev.growi.org/5f883d716897f900485b6a5a

- @2023 [Markdown を型付きオレオレ AST に変換する | giraphme/blog](https://giraph.me/articles/unified-with-ts/)

> 2020年ごろに Remark のパーサー（micromark）が仕様変更したことによって一部のプラグインが使用できなくなり、新旧入り乱れた情報が見つかるので、 2023年時点でどのように使ったかを記録しておきます。

- @2022 [MarkdownをHTMLに変換するunifiedインターフェースについての解説 #JavaScript - Qiita](https://qiita.com/masato_makino/items/ef35e6687a71ded7b35a)
- esm 対応で breaking change ?
- async
- https://github.com/70-10/blog/blob/main/tools/remark-ogp-card/index.js

https://github.com/unifiedjs/unified#plugin

- Parser
- Transformers
- Compiler

```ts
type Plugin<
  PluginParameters extends unknown[] = [],
  Input extends Node | string | undefined = Node,
  Output = Input,
> = (
  this: Processor,
  ...parameters: PluginParameters
) => Input extends string // Parser.
  ? Output extends Node | undefined
    ? undefined | void
    : never
  : Output extends CompileResults // Compiler.
    ? Input extends Node | undefined
      ? undefined | void
      : never
    : // Inspect/transform.
      | Transformer<
            Input extends Node ? Input : Node,
            Output extends Node ? Output : Node
          >
        | undefined
        | void;
```

- https://unifiedjs.com/learn/guide/create-a-remark-plugin/

## 9以前

- [Remark で広げる Markdown の世界](https://vivliostyle.github.io/vivliostyle_doc/ja/vivliostyle-user-group-vol2/spring-raining/index.html)
- `cjs` https://github.com/gladevise/remark-link-card

- Parser
- Transformer

# remark-parse

```ts
/**
 * @import {Root} from 'mdast'
 * @import {Options as FromMarkdownOptions} from 'mdast-util-from-markdown'
 * @import {Processor} from 'unified'
 */

/**
 * @typedef {Omit<FromMarkdownOptions, 'extensions' | 'mdastExtensions'>} Options
 */

import { fromMarkdown } from "mdast-util-from-markdown";

/**
 * Aadd support for parsing from markdown.
 *
 * @this {Processor<Root>}
 *   Processor instance.
 * @param {Readonly<Options> | null | undefined} [options]
 *   Configuration (optional).
 * @returns {undefined}
 *   Nothing.
 */
export default function remarkParse(options) {
  const self = this;

  /**
   * @param {string} document
   * @returns {Root}
   */
  self.parser = function (document) {
    return fromMarkdown(document, {
      ...self.data("settings"),
      ...options,
      // Note: these options are not in the readme.
      // The goal is for them to be set by plugins on `data` instead of being
      // passed by users.
      extensions: self.data("micromarkExtensions") || [],
      mdastExtensions: self.data("fromMarkdownExtensions") || [],
    });
  };
}
```
