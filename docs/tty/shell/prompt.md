# PS1

- @2022 [Mac，Ubuntuのプロンプト設定[折り返しが変] #Bash - Qiita](https://qiita.com/ysuzuki19/items/92c87bf099480109c2f6)
  > `\[\]` で囲むべし
- @2019 [プロンプトをカスタマイズしてターミナルを楽しく使おう💻 #Terminal - Qiita](https://qiita.com/guri3/items/dd6dc6168fc4c984c4ae)
- @2009 [シェルのプロンプトは改行しようぜ - 学習する機械、学習しない人間](https://okmount.hatenablog.com/entry/20090601/p1)

```
[myhost: ~/research/project/]
$
```

```sh
## \[ ... \] : encloses control sequence with \[ and \] for accurate word wrap
## \033[xxm : changes the color of command line
## \h : the hostname up to the first "."
## \w : current working directory
## \n : newline
## \$ : "$" for non-root, "#" for root
export PS1='\[\033[31m\][\h: \w]\n\$\[\033[30m\] '
```

# PROMPT_COMMAND

`PS1` を動的にする

- @2015 [[BASH] PROMPT_COMMANDで複数の処理を行う #Bash - Qiita](https://qiita.com/tay07212/items/9509aef6dc3bffa7dd0c)

## history

- @2025 [bashの複数端末で履歴共有する「おまじない」コマンドを詳しく調べてみた #Linux - Qiita](https://qiita.com/showchan33/items/bf323f1c7df60ebfbce1)

```sh
PROMPT_COMMAND="${PROMPT_COMMAND} history -a; history -c; history -r;"
```

## sample

```sh
Prompt() {
	share_history

	if [ -v TMUX ]; then
		if [ "$1" = "0" ]; then
			PS1="$(TmuxHeader)\n\[${F_CYAN}\]>\[${F_DEFAULT}\] "
		else
			PS1="$(TmuxHeader)\n\[${F_RED}\]>\[${F_DEFAULT}\] "
		fi
	else
		if [ "$1" = "0" ]; then
			PS1="$(Header)\n\[${F_CYAN}\]>\[${F_DEFAULT}\] "
		else
			PS1="$(Header)\n\[${F_RED}\]>\[${F_DEFAULT}\] "
		fi
	fi
}

PROMPT_COMMAND='Prompt $?'
```
