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
# Set-PSReadlineKeyHandler -Key 'Ctrl+e' -Function AcceptSuggestion #EndOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+e" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
Set-PSReadlineKeyHandler -Key 'Ctrl+m' -Function AcceptLine
Set-PSReadlineKeyHandler -Key 'Ctrl+k' -Function ForwardDeleteLine

Set-PSReadLineKeyHandler -Key "alt+r" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('<#SKIPHISTORY#> . $PROFILE')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;238m" }

# ctrl + [
# [System.Console]::ReadKey()
Set-PSReadlineKeyHandler -Key 'Ctrl+Oem4' -Function RevertLine

# https://qiita.com/AWtnb/items/5551fcc762ed2ad92a81
#
# module
# default not required
# Import-Module -Verbose -Name CompletionPredictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineOption -WordDelimiters ";:,.[]{}()/\|^&*-=+'`" !?@#$%&_<>「」（）『』『』［］、，。：；／"
Set-PSReadlineOption -AddToHistoryHandler {
  param ($command)
  switch -regex ($command)
  {
    "SKIPHISTORY"
    {
      return $false
    }
    "^[a-z]$"
    {
      return $false
    }
    "exit"
    {
      return $false
    }
  }
  return $true
}
# Import-Module -Verbose posh-git
# $GitPromptSettings.EnableFileStatus = $false
# Import-Module -Verbose -Name Terminal-Icons

Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

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

# a letter commands
Set-Alias l lazygit
Set-Alias v $NVIM_PATH
function p
{
  Set-Location $HOME/dotpixi
  &v
}
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

#
# path
#
function insertPath($path)
{
  if (-not $env:PATH.Split(";").Contains($path))
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
  if (-not $env:PATH.Split(";").Contains($path))
  {
    $env:PATH = $env:PATH + [System.IO.Path]::PathSeparator + $path
    $path
  } else
  {
    $null
  }
}
addPath(Join-Path $HOME "local/bin")
if ($IsWindows)
{
  $py_dir = py -c 'import sys; print(sys.base_prefix)'
  insertPath((Join-Path $py_dir "Scripts"))
  insertPath($py_dir)
  addPath("C:\Program Files\Git\usr\bin")
}

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

function rmrf()
{
  Remove-Item -Recurse -Force $args
}

#
# vcenv
#
Set-alias vswhere "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe"

function ExecuteCommand ($vc_dir)
{ 
  $bat = (Join-Path $vc_dir "VC\Auxiliary\Build\vcvars64.bat")
  # (Get-Item $bat)

  $pinfo = New-Object System.Diagnostics.ProcessStartInfo
  $pinfo.FileName = $env:COMSPEC
  $pinfo.RedirectStandardError = $true
  $pinfo.RedirectStandardOutput = $true
  $pinfo.RedirectStandardInput = $true
  $pinfo.UseShellExecute = $false
  # $commandArguments="/K `"$bat`""
  # $pinfo.Arguments = $commandArguments
  # $pinfo.ArgumentList.Add("/K")
  # $pinfo.ArgumentList.Add("`"$bat`"")
  # Write-Output $pinfo.ArgumentList
  $pinfo.WorkingDirectory = $vc_dir
  $p = New-Object System.Diagnostics.Process
  $p.StartInfo = $pinfo
  $p.Start() | Out-Null
  $p.StandardInput.WriteLine("call `"$bat`"")
  $p.StandardInput.WriteLine("set")
  $p.StandardInput.WriteLine("exit")

  $out = ""
  # require flush. WaitForExit cause dead lock
  while ($null -ne ($l = $p.StandardOutput.ReadLine()))
  {
    $out += "$l`n"
  }
  $p.WaitForExit()
  $p
  [pscustomobject]@{
    stdout   = $out
    stderr   = $p.StandardError.ReadToEnd()
    ExitCode = $p.ExitCode
  }
}

function vcenv()
{ 
  # $vc_dir = (Get-VSSetupInstance).InstallationPath
  $vc_dir = &vswhere -latest -products * -requires Microsoft.VisualStudio.Product.BuildTools -property installationPath
  if(!$vc_dir)
  {
    $vc_dir = &vswhere -latest -products * -requires Microsoft.VisualStudio.Product.Community -property installationPath
  }
  if (!$vc_dir)
  {
    $vc_dir = &vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath 
  }
  Write-Output $vc_dir
  $v = (ExecuteCommand $vc_dir)

  foreach ($l in $v.stdout.Split("`n"))
  {
    $kv = $l.Split("=", 2);
    switch ($kv[0])
    {
      "PATH"
      { 
        foreach ($e in $kv[1].Split(";"))
        {
          insertPath($e)
        }
      }
      "INCLUDE"
      {
        $env:INCLUDE = $kv[1] #+ ";$HOME\local\include"
        "INCLUDE=> $env:INCLUDE"
      }
      "LIB"
      {
        $env:LIB = $kv[1] #+ ";$HOME\local\lib"
        "LIB=> $env:LIB"
      }
      "LIBPATH"
      {
        "LIBPATH=> $($kv[1])"
        $env:LIBPATH = $kv[1]
      }
      "VCINSTALLDIR"
      {
        "VCINSTALLDIR=> $($kv[1])"
        $env:VCINSTALLDIR = $kv[1]
      }
      "VSINSTALLDIR"
      {
        "VSINSTALLDIR=> $($kv[1])"
        $env:VSINSTALLDIR = $kv[1]
      }
      "VSCMD_VER"
      {
        "VSCMD_VER=> $($kv[1])"
        $env:VSCMD_VER = $kv[1]
      }
      "VCTOOLSINSTALLDIR"
      {
        "VCTOOLSINSTALLDIR=> $($kv[1])"
        $env:VCTOOLSINSTALLDIR = $kv[1]
      }
    }
  }
  # Write-Output $v.stdout
}

#
# prompt
#
$IconMap = @{
  dotfiles             = " "
  obsidian             = "📚"
  rtc_memo             = "⚡"
  UniVRM               = " "
  minixr               = " "
  "ousttrue.github.io" = " "
  cmake_book           = "📙"
  blender_book         = "📙"
  lbsm                 = "🐵"
  "gltf-samples"       = "🗿"
}

$BLENDER = Join-Path $HOME "AppData\Roaming\Blender Foundation\Blender" 

function get_git_status()
{
  git rev-parse --is-inside-work-tree 2>$null
  if (!$?)
  {
    return $false
  }

  $lines = @(git status --porcelain --branch)
  $sync = ""
  if ($lines[0] -match "\[([^]]+)\]")
  {
    $splits = $Matches[1].split(', ')
    for ($i = 0; $i -lt $splits.Length; $i++)
    {
      if ($splits[$i] -match "(\w+)\s+(\d+)")
      {
        $sync_status = $matches[1]
        $n = $matches[2]
        if ($sync_status -eq "behind")
        {
          $sync += " ${n}"
        } elseif ($sync_status -eq "ahead")
        {
          $sync += " ${n}"
        }
      }
    }
  } else
  {
    $sync = " "
  }

  # A, M, D, ?, U, !, C, R
  $status = @{
  }
  $iconMap = @{
    "?" = " "
    "M" = " "
    "D" = " "
    "R" = "↷ "
  }
  for ($i = 1; $i -lt $lines.Length; $i++)
  {
    $line = $lines[$i]
    $key = $line.Substring(1, 1)
    $status[$key] += 1
  }
  foreach ($key in $status.Keys)
  {
    $icon = $iconMap[$key]
    if ([string]::IsNullOrWhiteSpace($icon))
    {
      $icon = $key
    }
    $sync += "${icon}$($status[$key])"
  } 
 
  return $sync
}

function replacePrefix($full, $prefix, $to)
{
  if ($full -eq $prefix)
  {
    return $to
  } 

  if($full -is [string])
  {
    return $to + $full.Substring($prefix.Length)
  }

  return $to + $full.FullName.Substring($prefix.Length)
}

function prompt()
{
  # TODO: git status
  # TODO: project kind
  # - dotfiles
  # - ghq
  # - lang
  $color = $? ? "32" : "31";

  $prefix = "🤔"
  if ($IsWindows)
  {
    $prefix = " "
  } elseif ($IsLinux)
  {
    $prefix = " "
  } elseif ($IsMacOS)
  {
    $prefix = " "
  }

  $location = (Get-Item -force (Get-Location));
  $title = $location.Name
  if ($GHQ_ROOT -and $location.FullName.StartsWith($GHQ_ROOT.FullName + $SEP))
  {
    $location = $location.FullName.Substring($GHQ_ROOT.FullName.Length + 1)
    if ($location.StartsWith( "github.com${SEP}"))
    {
      $location = $location.Substring("github.com${SEP}".Length)
      if ($location.StartsWith("ousttrue"))
      {
        $location = replacePrefix $location "ousttrue" " "
      } else
      {
        $location = " " + $location
      }
    } else
    {
      $location = " " + $location
    }
  } elseif($location.FullName.StartsWith($BLENDER))
  {
    $location = replacePrefix $location $BLENDER "󰂫 "
  } elseif ($location.FullName.StartsWith($HOME))
  {
    $location = replacePrefix $location $HOME " "
  } 

  # wezterm only
  if ($env:TERM -eq "tmux-256color")
  {
    if ($IconMap[$title])
    {
      tmux rename-window $IconMap[$title]
    } else
    {
      tmux rename-window $title
    }
  } else
  {
    if ($IconMap[$title])
    {
      $title = $IconMap[$title]
    }
  }

  $sync = (get_git_status)
  if ($sync)
  {
    $branch = $(git branch --show-current)
    if ($branch)
    {
      $log = $(git log "--pretty=format:#%h  %cr   %s" -n 1)
      $ref = (git rev-parse --abbrev-ref origin/HEAD).Split("/", 2)[1]
      $branch_color = "`e[30m`e[42m";
      if ($branch -ne $ref)
      {
        # red
        $branch_color = "`e[30m`e[41m";
      }
      $branch = "${branch_color}  ${branch} `e[0m ${sync} ${log}"
    }
  } 

  # https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  $out = "";
  if ($loc.Provider.Name -eq "FileSystem")
  {
    $out += "`e]9;9;`"$($loc.ProviderPath)`"`e$([char]0x5c)"
  }

  # OSC7
  # https://wezfurlong.org/wezterm/shell-integration.html#osc-7-on-windows-with-cmdexe
  "${out} `e]2;${title}$([char]0x07)${prefix}`e[7m${location}`e[0m${branch}`n`e[${color}m>`e[0m "
}

