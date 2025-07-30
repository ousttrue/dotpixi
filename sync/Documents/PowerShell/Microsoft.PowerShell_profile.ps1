#
# sync/HOME/.local/share/powershell/Modules
#
$ErrorActionPreference = "Stop"

#
# readline
#
# https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.2
# まとめて設定
#
# Set-PSReadLineOption -EditMode emacs
# 個別に設定
Set-PSReadlineKeyHandler -Key 'Ctrl+u' -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Key 'Ctrl+b' -Function BackwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+f' -Function ForwardChar
Set-PSReadlineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Key 'Ctrl+h' -Function BackwardDeleteChar
Set-PSReadlineKeyHandler -Key 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key 'Ctrl+n' -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key 'Ctrl+a' -Function BeginningOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+e' -Function AcceptSuggestion #EndOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+m' -Function AcceptLine
Set-PSReadlineKeyHandler -Key 'Ctrl+k' -Function ForwardDeleteLine

Set-PSReadLineKeyHandler -Key "alt+r" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('<#SKIPHISTORY#> . $PROFILE')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# ctrl + [
# [System.Console]::ReadKey()
Set-PSReadlineKeyHandler -Key 'Ctrl+Oem4' -Function RevertLine

#
# platform
#
$EXE = ""
$env:_CL_ = "/utf-8"
$env:XDG_CONFIG_HOME = "$HOME/.config"
if ($IsWindows)
{
  chcp 65001
  $env:HOME = $env:USERPROFILE
  $EXE = ".exe"
  Set-Alias winget (Join-Path $env:LOCALAPPDATA "Microsoft\WindowsApps\winget.exe")
  Set-Alias nu (Join-Path $env:LOCALAPPDATA "Programs\nu\bin\nu.exe")
  $env:YAZI_FILE_ONE="C:\Program Files\Git\usr\bin\file.exe"
  $env:YAZI_CONFIG_HOME=(Join-Path $HOME ".config/yazi")
} 
$NVIM_PREFIX = Join-Path $HOME "neovim"
$NVIM_PATH =(Join-Path $NVIM_PREFIX "/bin/nvim${EXE}")
if (-not (Test-Path $NVIM_PATH))
{
  $NVIM_PATH = "C:\Program Files\Neovim\bin\nvim.exe"
}
Set-Alias v $NVIM_PATH
if (Test-Path $NVIM_PATH)
{
  $env:EDITOR = $NVIM_PATH
} else
{
  $env:EDITOR = "vim"
}
$shada_dir = (Join-Path ${env:HOME} ".local/state/nvim/shada") 
if ($IsWindows)
{
  $shada_dir = (Join-Path ${env:LOCALAPPDATA} "\nvim-data\shada") 
}

$env:FZF_DEFAULT_OPTS = "--layout=reverse --preview-window down:70%"
$env:FZF_DEFAULT_COMMAND = "fd --type f -H -E .git"

function has($cmdname)
{
  try
  {
    # CmdletInfo | ApplicationInfo | AliasInfo | FunctionInfo
    switch (Get-Command $cmdname -ErrorAction Stop)
    {
      { $_ -is [System.Management.Automation.AliasInfo] }
      {
        $_.Definition
      }
      { $_ -is [System.Management.Automation.ApplicationInfo] }
      {
        $_.Definition
      }
      { $_ -is [System.Management.Automation.CmdletInfo] }
      {
        $_
      }
      { $_ -is [System.Management.Automation.FunctionInfo] }
      {
        $_
      }
      default
      {
        $_.GetType()
      }
    }
  } catch
  {
    return $false;
  }
}
if (!(has 'which'))
{
  Set-Alias which has
}
if (has ghq)
{
  $GHQ_ROOT = (Get-Item (ghq root))
}
if(has ov)
{
  $env:PAGER="ov"
}

#
# path
#
function insertPath($path)
{
  if (-not $env:PATH.Contains($path))
  {
    $env:PATH = $path + [System.IO.Path]::PathSeparator + $env:PATH
    $path
  } else
  {
    $null
  }
}
#
function addPath($path)
{
  if (-not $env:PATH.Contains($path))
  {
    $env:PATH = $env:PATH + [System.IO.Path]::PathSeparator + $path
    $path
  } else
  {
    $null
  }
}
addPath(Join-Path $HOME "local/bin")
addPath(py -c 'import sys; print(sys.base_prefix)')

# For zoxide v0.8.0+
if (has zoxide)
{
  Invoke-Expression (& {
      $hook = if ($PSVersionTable.PSVersion.Major -lt 6)
      {
        'prompt' 
      } else
      {
        'pwd' 
      }
      (zoxide init --hook $hook powershell | Out-String)
    })
}

function p
{
  Set-Location $HOME/dotpixi
  &v
}

# cd ghq
function gg
{
  $dst = $(ghq list -p | fzf --reverse +m --preview "bat --color=always --style=header,grid --line-range :100 {}/README.md")
  if ($dst)
  {
    Set-Location "$dst"
  }
}

# git switch
function gs
{
  $dst = $(git branch | fzf)
  if ($dst)
  {
    git switch $args $dst.Trim()
  }
}

function git_rm_merged
{
  git branch --merged
  | Select-String -NotMatch -Pattern "(\*|develop|master)" 
  | ForEach-Object { git branch -d $_.ToString().Trim() }
}

# https://zenn.dev/ciffelia/articles/c394962a8f188a
function fapt
{
  $result = apt list | cut -d "/" -f 1 | fzf --preview "apt-cache show {}"
  if ($result)
  {
    sudo apt install $result
  }
}

function fpac
{
  $result = pacman -Sl | cut -d " " -f 2 | fzf --preview "pacman -Si {}"
  if ($result)
  {
    sudo pacman -S $result
  }
}

# https://qiita.com/www-tacos/items/d23b24f5af8687f2db88
function Windows-RightClick
{
  $key = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
  if (! (Test-Path ${key}) )
  {
    New-Item ${key} -Force
  }
  Set-ItemProperty ${key} -Name "(default)" -Value ""
  Stop-Process -Name explorer -Force
}

# yazi
function y
{
  $tmp = (New-TemporaryFile).FullName
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp -Encoding UTF8
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path)
  {
    Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    if(has lsd)
    {
      lsd
    }
  }
  Remove-Item -Path $tmp
}
