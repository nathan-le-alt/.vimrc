@echo off
rem Run once. Clink saves these values to clink_settings.

rem History
clink set history.shared true
clink set history.dupe_mode erase_prev
clink set history.ignore_space true
clink set history.max_lines 2000
clink set history.dont_add_to_history_cmds "clear cls exit pwd"

rem Completion
clink set match.ignore_case relaxed

rem Enable the core autocomplete functionality
clink set autosuggest.enable true

rem Enable the gray, inline "predictive text" as you type
clink set autosuggest.inline true

rem (Optional) Enable the interactive suggestion list popup 
clink set suggestionlist.default false

rem Hide logo
clink set clink.logo none

