[PSReadLine について - PowerShell | Microsoft Learn](https://learn.microsoft.com/ja-jp/powershell/module/psreadline/about/about_psreadline?view=powershell-7.4)

- [PSReadLineで提供される入力履歴の削除について #PowerShell - Qiita](https://qiita.com/SAITO_Keita/items/ff654b2e50ed7358c185)

- [GitHub - PowerShell/PSReadLine: A bash inspired readline implementation for PowerShell](https://github.com/PowerShell/PSReadLine)

- `color` @2021 [PowerShellのプロファイルをカスタマイズしてCLIの操作を快適にする - sheepla-note](https://sheepla.github.io/sheepla-note/posts/powershell-customization/)
- @2020 [【PowerShell】PsReadLine 設定のススメ - Qiita](https://qiita.com/AWtnb/items/5551fcc762ed2ad92a81)

# Version

```sh
Get-Module -Name PSReadLine
```

## 2.3.5

## 2.3.4

## 2.2.6

- `Predictive IntelliSense` @2022 [[PowerShell] PSReadLine 2.2がリリースされました | DevelopersIO](https://dev.classmethod.jp/articles/powershell-psreadline-22-released/)

## 2.1

- @2020 [Announcing PSReadLine 2.1+ with Predictive IntelliSense - PowerShell Team](https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/)

# option

- @2022 [Linuxで快適にPowershellを使うためのコツ #Linux - Qiita](https://qiita.com/Anubis_369/items/6339ce48288edf93b2ed)

## Get-PSReadlineOption

## Get-PSReadLineKeyHandler

# KeyHandler

- [Set-PSReadLineKeyHandler (PSReadLine) - PowerShell | Microsoft Learn](https://learn.microsoft.com/ja-jp/powershell/module/psreadline/set-psreadlinekeyhandler?view=powershell-7.2)
- [about PSReadLine Functions - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.2)
- [PSReadLine キー ハンドラーの使用 - PowerShell | Microsoft Learn](https://learn.microsoft.com/ja-jp/powershell/scripting/learn/shell/using-keyhandlers?view=powershell-7.4)

`profile.ps1`

```ps1
Set-PSReadlineKeyHandler -Key 'Ctrl+u' -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Key 'Ctrl+b' -Function BackwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+f' -Function ForwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+d' -Function DeleteChar
Set-PSReadlineKeyHandler -Key 'Ctrl+h' -Function BackwardDeleteChar
Set-PSReadlineKeyHandler -Key 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key 'Ctrl+n' -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key 'Ctrl+a' -Function BeginningOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+e' -Function EndOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+m' -Function AcceptLine
Set-PSReadlineKeyHandler -Key 'Ctrl+k' -Function ForwardDeleteLine
```

# prompt

[about Prompts - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.4)

- @2022 [PowerShellのprompt関数について - Qiita](https://qiita.com/SAITO_Keita/items/47eb86a6d5dc5f928608)
- @2021 [PowerShellでプロンプト表示を変える](https://zenn.dev/kumarstack55/articles/2021-01-24-powershell-prompt)
- @2020 [Windows PowerShellのプロンプトを変更する](https://bayashi.net/diary/2020/0615)
- @2016 [【PowerShell】 プロンプトの表示を変更する - 1.21 jigowatts](https://sh-yoshida.hatenablog.com/entry/2016/12/20/130000)

## color

[Using ANSI Escape Sequences in PowerShell :: — duffney.io](https://duffney.io/usingansiescapesequencespowershell/)

## title

- @2022 [ASCII.jp：Windowsでコンソールのウィンドウタイトルを書き換える (2/2)](https://ascii.jp/elem/000/004/099/4099109/2/)

## Set-PSReadlineKeyHandler -Function

Abort
AcceptAndGetNext
AcceptLine
AcceptNextSuggestionWord
AcceptSuggestion
AddLine
BackwardChar
BackwardDeleteChar
BackwardDeleteInput
BackwardDeleteLine
BackwardDeleteWord
BackwardKillInput
BackwardKillLine
BackwardKillWord
BackwardWord
BeginningOfHistory
BeginningOfLine
CancelLine
CapitalizeWord
CaptureScreen
CharacterSearch
CharacterSearchBackward
ClearHistory
Clear
Screen
Complete
Copy
CopyOrCancelLine
Cut
DeleteChar
DeleteCharOrExit
DeleteEndOfBuffer
DeleteEndOfWord
DeleteLine
DeleteLineToFirstChar
DeletePreviousLines
DeleteToEnd
DeleteWord
DigitArgument
DowncaseWord
EndOfHistory
EndOfLine
ExchangePointAndMark
ForwardChar
ForwardDeleteInput
ForwardDeleteLine
ForwardSearchHistory
ForwardWord
GotoBrace
GotoColumn
GotoFirstNonBlankOfLine
HistorySearchBackward
HistorySearchForward
InsertLineAbove
InsertLineBelow
InvertCase
InvokePrompt
KillLine
KillRegion
KillWord
MenuComplete
MoveToEndOfLine
NextHistory
NextLine
NextSuggestion
NextWord
NextWordEnd
Paste
PasteAfter
PasteBefore
Possibl
eCompletions
PrependAndAccept
PreviousHistory
PreviousLine
PreviousSuggestion
Redo
RepeatLastCharSearch
RepeatLastCharSearchBackwards
RepeatLastCommand
RepeatSearch
RepeatSearchBackward
ReverseSearchHistory
RevertLine
ScrollDisplayDown
ScrollDisplayDownLine
ScrollDisplayToCursor
ScrollDisplayTop
ScrollDisplayUp
ScrollDisplayUpLine
SearchChar
SearchCharBackward
SearchCharBackwardWithBackoff
SearchCharWithBackoff
SearchForward
SelectAll
SelectBackwardChar
SelectBackwardsLine
SelectBackwardWord
SelectCommandArgument
SelectForwardChar
SelectForwardWord
SelectLine
SelectNextWord
SelectShellBackwardWord
SelectShellForwardWord
SelectShellNextWord
SelfInsert
SetMark
ShellBackwardKillWord
ShellBackwardWord
ShellForwardWord
ShellKillWord
ShellNextWord
ShowCommandHelp
ShowFullPredictionTooltip
ShowKeyBindings
ShowParameterHelp
SwapCharacters
SwitchPredictionView
TabCompleteNext
TabCompletePrevious
Undo
UndoAll
UnixWordRubout
UpcaseWord
ValidateAndAcceptLine
ViAcceptLine
ViAcceptLineOrExit
ViAppendLine
ViBackwardChar
ViBackwardDeleteGlob
ViBackwardGlob
ViBackwardWord
ViCommandMode
ViDeleteBrace
ViDeleteEndOfGlob
ViDeleteGlob
ViDeleteToBeforeChar
ViDeleteToBeforeCharBackward
ViDeleteToChar
ViDeleteToCharBackward
ViDigitArgumentInChord
ViEditVisually
ViEndOfGlob
ViEndOfPreviousGlob
ViExit
ViForwardChar
ViGotoBrace
ViInsertAtBegining
ViInsertAtEnd
ViInsertLine
ViInsertMode
ViInsertWithAppend
ViInsertWithDelete
ViJoinLines
ViNextGlob
ViNextWord
ViReplaceLine
ViReplaceToBeforeChar
ViReplaceToBeforeCharBackward
ViReplaceToChar
ViReplaceToCharBackward
ViSearchHistoryBackward
ViTabCompleteNext
ViTabComple
tePrevious
ViYankBeginningOfLine
ViYankEndOfGlob
ViYankEndOfWord
ViYankLeft
ViYankLine
ViYankNextGlob
ViYankNextWord
ViYankPercent
ViYankPreviousGlob
ViYankPreviousWord
ViYankRight
ViYankToEndOfLine
ViYankToFirstChar
WhatIsKey
Yank
YankLastArg
YankNthArg
YankPop
