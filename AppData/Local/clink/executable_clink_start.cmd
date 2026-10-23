@echo off
rem Aliases and functions. Clink runs this file at every cmd start.

rem Config shortcuts
doskey edcmd=vim "%LOCALAPPDATA%\clink\clink_start.cmd"
doskey recmd=call "%LOCALAPPDATA%\clink\clink_start.cmd"
doskey edhistory=vim "%LOCALAPPDATA%\clink\clink_history"
doskey python=python3 $*

rem User profile (~)
doskey ~ = %USERPROFILE%

rem Clear Unix-like
doskey clear=cls

rem Navigation
doskey ..=cd ..
doskey ...=cd ..\..

rem Listing (install eza first)
doskey ls=eza -lb --long --header --git --color=always --icons=always --group-directories-first $*

rem Ask before delete
doskey rm=del /p $*

rem Public IP
doskey ipe=curl ipinfo.io/ip

rem Package updates
doskey supdate=winget upgrade --all

rem Docker
doskey dcbuild=docker compose build
doskey dcup=docker compose up -d
doskey dcdown=docker compose down
doskey dockps=docker ps --format "{{.ID}} {{.Names}}"
doskey docksh=docker exec -it $1 /bin/bash
doskey dockrst=docker restart $1

rem Git (replaces the Oh My Zsh git plugin)
doskey gst=git status
doskey ga=git add $*
doskey gaa=git add --all
doskey gcmsg=git commit -m $*
doskey gco=git checkout $*
doskey gd=git diff $*
doskey gl=git pull
doskey gp=git push
doskey glog=git log --oneline --graph --decorate

rem Tab Completion
set FZF_COMPLETION_OPTS=--bind tab:down,btab:up --cycle

rem --- Psmux initialization (replaces the tmux block of .zshrc) ---
rem Keep this at the very end of clink_start.cmd, after the doskey lines.
rem Skip when cmd runs a single command (cmd /c), the same job as the PS1 check.
set PSMUX_SKIP=
echo %cmdcmdline% | find /i " /c " >nul && set PSMUX_SKIP=1
rem Psmux sets TMUX and PSMUX_SESSION inside every pane. Skip there.
rem Also skip when NOPSMUX is set or psmux is missing.
if not defined TMUX if not defined PSMUX_SESSION if not defined NOPSMUX if not defined PSMUX_SKIP where psmux >nul 2>&1 && psmux new-session && exit
set PSMUX_SKIP=

set CLINK_START_LOADED=1
