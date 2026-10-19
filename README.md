# Vim Development Environment Configuration

[![Vim](https://img.shields.io/badge/Editor-Vim-019733?logo=vim&logoColor=white)](https://www.vim.org/)
[![Vim-Plug](https://img.shields.io/badge/Plugins-vim--plug-blue)](https://github.com/junegunn/vim-plug)
[![CoC.nvim](https://img.shields.io/badge/Language%20Support-CoC.nvim-6C63FF)](https://github.com/neoclide/coc.nvim)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)](#prerequisites)

A modular Vim configuration for software development, with custom keybindings, language intelligence, diagnostics, Git integration, file navigation, and an integrated code runner for Python, C, and JavaScript.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [Prerequisites and Dependencies](#prerequisites-and-dependencies)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Keybindings Reference](#keybindings-reference)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository provides a customized Vim development environment designed to improve editing efficiency and streamline common programming workflows. The configuration combines Vim's native editing features with community plugins for code completion, diagnostics, snippets, file browsing, Git change indicators, and interface customization.

The configuration supports Windows, Linux, and macOS with platform-dependent plugin directories. It also defines a custom code runner for Python, C, and JavaScript, plus separate configuration files for individual plugins and development features.

### Design Goals

- Maintain efficient keyboard-driven editing workflows.
- Provide consistent indentation, navigation, and search behavior.
- Integrate language intelligence and diagnostic feedback.
- Simplify source-code execution from within Vim.
- Keep plugin settings organized in separate configuration files.
- Back up the Vim configuration automatically after relevant edits.

## Key Features

### Editing and Navigation

- Syntax highlighting and true-color terminal support.
- Absolute line numbers, cursor-line highlighting, and cursor-position reporting.
- Smart case-insensitive searching with incremental search and highlighted matches.
- Configurable indentation, with four-space indentation for Python and two-space indentation by default.
- Persistent buffers and configurable horizontal and vertical splits.
- Keyboard shortcuts for buffer switching, window navigation, and window resizing.
- Clipboard integration with fallback support for Vim builds lacking `unnamedplus`.

### Code Intelligence

- CoC.nvim integration for language-server-based completion and diagnostics.
- Dedicated diagnostic highlighting for errors, warnings, information, and hints.
- Floating-window support for diagnostic messages and documentation.
- Snippet support through `vim-snippets` and separate CoC snippet configuration.
- Optional configuration files for additional language tooling and formatting.

CoC.nvim functionality depends on the installed CoC extensions, compatible language servers, and their respective runtime dependencies.

### Integrated Code Runner

The custom `Runcode()` function executes supported source files from Vim.

| Language   | Vim filetype | Execution command                                             |
| ---------- | ------------ | ------------------------------------------------------------- |
| Python     | `python`     | `python3 <file>`                                              |
| C          | `c`          | `gcc <file> -o <output> -Wall -Wextra`, followed by execution |
| JavaScript | `javascript` | `node <file>`                                                 |

The runner saves the current file, opens a terminal split at the bottom of the window, and executes the corresponding command. It removes existing terminal buffers before starting a new run.

### Interface and Productivity

- CodeDark color scheme.
- Vim Airline status line and theme support.
- Indentation guides through indentLine.
- File icons through vim-devicons.
- File-tree navigation through NERDTree.
- Git change indicators through vim-gitgutter.
- Comment toggling through vim-commentary.
- Surrounding-character editing through vim-surround.
- Multiple-cursor editing through vim-visual-multi.
- Automatic backup of the Vim configuration to `~/_vimrc.bak`.

## Technology Stack

| Component              | Purpose                                                   |
| ---------------------- | --------------------------------------------------------- |
| Vim                    | Primary text editor                                       |
| Vimscript              | Configuration, autocommands, keybindings, and code runner |
| vim-plug               | Plugin installation and management                        |
| CoC.nvim               | Completion, language-server integration, and diagnostics  |
| Vim Airline            | Status line customization                                 |
| NERDTree               | File-system navigation                                    |
| vim-gitgutter          | Git change indicators                                     |
| vim-snippets           | Reusable code snippets                                    |
| CodeDark               | Color scheme                                              |
| Python 3, GCC, Node.js | Runtime and compiler dependencies for the code runner     |

The repository also references separate plugin configuration files under `~/.vim/vim-config/` or `~/vimfiles/vim-config/`, depending on the operating system.

## Prerequisites and Dependencies

### Required Software

Install the following before configuring the environment:

- **Vim:** A build with terminal support. True-color support is recommended.
- **Git:** Required to clone the repository and install plugins.
- **vim-plug:** Required to manage the configured plugins.
- **Python 3:** Required to execute Python files.
- **GCC:** Required to compile and execute C files.
- **Node.js:** Required to execute JavaScript files.
- **Node.js and npm:** Required for CoC.nvim and its extension ecosystem.

Some dependencies apply only to particular features. Python, GCC, and Node.js are required only for their corresponding code-runner workflows.

### Platform Considerations

- **Linux:** The configuration uses `~/.vim/plugged` for plugins and `~/.vim/vim-config/` for auxiliary configuration files.
- **macOS:** The configuration follows the Unix-style paths. Confirm terminal support and executable availability.
- **Windows:** The configuration uses `~/vimfiles/plugged` and `~/vimfiles/vim-config/`. Confirm that Vim, Git, and the selected compiler or runtime are available through your terminal environment.

The code runner uses `python3`, `gcc`, and `node` as executable names. Adjust these commands if your environment uses different names.

## Installation

### 1. Clone the Repository

Replace the placeholder repository URL with your GitHub repository URL.

```bash
git clone https://github.com/<username>/<repository>.git
cd <repository>
```

### 2. Back Up Your Existing Configuration

On Linux or macOS:

```bash
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc.backup
```

On Windows, back up your existing `_vimrc` or `vimrc` file before replacing it.

### 3. Install the Configuration File

For Linux or macOS, copy the repository configuration to `~/.vimrc`:

```bash
cp .vimrc ~/.vimrc
```

For Windows, copy the configuration to the appropriate Vim configuration path, typically `~/_vimrc` or `~/vimfiles/vimrc`.

If the repository file is named `_vimrc`, use that filename as the source.

### 4. Install vim-plug

Follow the installation instructions in the [vim-plug repository](https://github.com/junegunn/vim-plug).

Verify that Vim recognizes the plugin manager before proceeding.

### 5. Install the Plugins

Launch Vim:

```bash
vim
```

Run the following command inside Vim:

```vim
:PlugInstall
```

Wait for the plugin installation process to finish. Restart Vim afterward.

### 6. Install CoC Extensions and Language Servers

CoC.nvim requires compatible extensions or language servers for language-specific functionality.

Open Vim and inspect the repository's `coc-extensions.vim` configuration. Install the required extensions according to the project's intended language support.

For example, if the corresponding CoC extension supports Python:

```vim
:CocInstall coc-pyright
```

The exact extension list depends on your configuration and installed Node.js version.

### 7. Configure Auxiliary Files

The main configuration sources additional files from a dedicated directory.

Create the directory if it does not exist:

```bash
mkdir -p ~/.vim/vim-config
```

On Windows, create the equivalent `vimfiles/vim-config` directory.

Place the required configuration files in this directory. Review [Configuration](#configuration) for the expected filenames.

**Important:** The main configuration references multiple auxiliary files. Installation will produce Vim errors if any referenced file is missing. Ensure all required files exist before using the configuration.

## Usage

### Launch Vim

Open Vim normally or specify a source file:

```bash
vim
vim example.py
```

### Run Supported Source Files

Open a supported source file and press the configured code-runner shortcut:

```text
Space + \
```

The runner saves the current buffer, opens a terminal split, and executes the source file according to its Vim filetype.

Example Python program:

```python
print("Hello, World!")
```

Save the file as `example.py`, open it in Vim, and press `Space` followed by `\`.

The runner invokes:

```bash
python3 /path/to/example.py
```

Example C program:

```c
#include <stdio.h>

int main(void)
{
    printf("Hello, World!\n");
    return 0;
}
```

Save the file as `example.c` and use the same shortcut. The runner compiles the source with GCC and executes the resulting binary.

Example JavaScript program:

```javascript
console.log("Hello, World!");
```

Save the file as `example.js` and use the same shortcut. The runner executes the file through Node.js.

### Search Within Files

Use Vim's native search commands:

```vim
/keyword
?keyword
n
N
:nohlsearch
```

- `/keyword` searches forward.
- `?keyword` searches backward.
- `n` moves to the next match.
- `N` moves to the previous match.
- `:nohlsearch` clears search highlighting.

Press Enter to clear search highlighting through the configured mapping.

### Manage Files and Buffers

Use the configured shortcuts to switch between buffers, create splits, and navigate the editor.

For file-tree navigation, use the NERDTree commands provided by the installed plugin and any mappings defined in `nerdtree.vim`.

## Configuration

### Main Configuration

The primary Vim configuration defines:

- Editor defaults and indentation.
- Search behavior and navigation.
- Clipboard integration.
- Window and buffer management.
- Diagnostic highlighting.
- Custom keybindings.
- The `Runcode()` function.
- Plugin declarations and initialization.
- Automatic configuration backups.

### Plugin Configuration Directory

The main configuration expects the following files:

| File                     | Purpose                       |
| ------------------------ | ----------------------------- |
| `vim-airline-config.vim` | Airline status line settings  |
| `gitgutter.vim`          | Git change indicators         |
| `indentLine-config.vim`  | Indentation guide settings    |
| `coc-config.vim`         | CoC.nvim configuration        |
| `ale-config.vim`         | ALE configuration             |
| `coc-snippet.vim`        | CoC snippet settings          |
| `coc-diagnostics.vim`    | Diagnostic customization      |
| `coc-prettier.vim`       | Prettier integration settings |
| `jsdoc.vim`              | JSDoc-related settings        |
| `nerdtree.vim`           | NERDTree settings             |
| `coc-extensions.vim`     | CoC extension configuration   |

These files are referenced by the main configuration, but their contents are not included in the supplied configuration file. Obtain them from the repository or create compatible files before launching Vim.

### Custom Keybindings

The leader key defaults to Space:

```vim
let mapleader = " "
```

The code runner uses:

```vim
nnoremap <silent> <leader>\ :call Runcode()<cr>
```

To change the leader key, edit the `mapleader` assignment near the beginning of the configuration. Review any custom mappings before assigning new shortcuts.

### Code Runner Behavior

The runner currently supports three Vim filetypes:

```vim
if l:filetype ==# 'python'
  let l:cmd = ['python3', l:file]
elseif l:filetype ==# 'c'
  let l:cmd = ['bash', '-c', 'gcc "$1" -o "$2" -Wall -Wextra && "$2"', 'bash', l:file, l:output]
elseif l:filetype ==# 'javascript'
  let l:cmd = ['node', l:file]
endif
```

Add further language support by extending the filetype conditions with the required command and arguments.

The C runner writes the executable to the source file's basename without its extension. Ensure the directory permits file creation and execution.

The runner also removes existing terminal buffers before starting a new execution. Avoid using it while you need to preserve output from an earlier terminal buffer.

### Automatic Backup

The configuration defines an autocommand that backs up the Vim configuration to:

```text
~/_vimrc.bak
```

The backup runs after a write operation matching `*vimrc`. Review this behavior if you keep multiple configuration files or use a different naming convention.

## Keybindings Reference

The following mappings are defined by the main configuration.

| Shortcut           | Action                                                                         |
| ------------------ | ------------------------------------------------------------------------------ |
| `Space` + `y`      | Copy selected text to the system clipboard                                     |
| `gG`               | Select the entire file                                                         |
| `Enter`            | Clear search highlighting                                                      |
| `Shift` + `h`      | Switch to the previous buffer                                                  |
| `Shift` + `l`      | Switch to the next buffer                                                      |
| `Ctrl` + `h`       | Move to the window on the left                                                 |
| `Ctrl` + `j`       | Move to the window below                                                       |
| `Ctrl` + `k`       | Move to the window above                                                       |
| `Ctrl` + `l`       | Move to the window on the right                                                |
| `Ctrl` + `Up`      | Increase window height                                                         |
| `Ctrl` + `Down`    | Decrease window height                                                         |
| `Ctrl` + `Left`    | Decrease window width                                                          |
| `Ctrl` + `Right`   | Increase window width                                                          |
| `Space` + `w`      | Close the current buffer                                                       |
| `sh`               | Create a horizontal split                                                      |
| `sv`               | Create a vertical split                                                        |
| `sc`               | Close the current window                                                       |
| `so`               | Close all other windows                                                        |
| `Space` + `\`      | Run the current supported source file                                          |
| `d`, `c`, `x`      | Delete, change, or delete a character without overwriting the default register |
| `Space` + `d`      | Delete while preserving the default register                                   |
| `Space` + `dd`     | Delete the current line while preserving the default register                  |
| `p` in Visual mode | Paste over a selection without replacing the default register                  |

The configuration also remaps `?` to display the current mappings.

Some shortcuts depend on terminal key handling, Vim version, and plugin configuration.

## Project Structure

A typical repository layout is:

```text
.
├── README.md
├── .vimrc
└── vim-config/
    ├── vim-airline-config.vim
    ├── gitgutter.vim
    ├── indentLine-config.vim
    ├── coc-config.vim
    ├── ale-config.vim
    ├── coc-snippet.vim
    ├── coc-diagnostics.vim
    ├── coc-prettier.vim
    ├── jsdoc.vim
    ├── nerdtree.vim
    └── coc-extensions.vim
```

This layout illustrates the expected organization. The repository must include the referenced auxiliary files, or the main configuration must be updated to match the actual directory structure.

## Troubleshooting

### Plugins Do Not Load

1. Confirm vim-plug is installed.
2. Run `:PlugInstall` inside Vim.
3. Restart Vim.
4. Review errors with `:messages`.

### Missing Configuration File Errors

Confirm every file referenced by an `execute 'source ...'` statement exists at the expected path. Check filename spelling, directory names, and platform-specific paths.

### CoC.nvim Does Not Provide Completions

1. Confirm Node.js and npm are installed.
2. Check the CoC.nvim installation.
3. Verify the relevant language extension or language server is installed.
4. Inspect CoC.nvim diagnostics and Vim messages.

### The Code Runner Does Not Execute a File

1. Confirm the current buffer has a supported filetype.
2. Save the file.
3. Verify the required runtime or compiler is available on `PATH`.
4. Test the corresponding command directly in a terminal.
5. Check for compiler errors or runtime exceptions in the terminal split.

You could verify executable availability with:

```bash
python3 --version
gcc --version
node --version
```

### Clipboard Integration Does Not Work

Clipboard support depends on your Vim build and operating system. Verify the output of:

```vim
:version
```

Check for clipboard support and confirm that the operating system provides a compatible clipboard service.

## Contributing

Contributions are welcome. Follow these steps to propose a change:

1. Fork the repository.
2. Create a descriptive feature branch.
3. Make focused changes to the configuration or documentation.
4. Test the changes on a supported Vim environment.
5. Verify plugin installation and startup behavior.
6. Submit a pull request with a clear description of the changes.

### Contribution Guidelines

- Preserve existing Vimscript conventions.
- Document new keybindings and configuration options.
- Keep plugin-specific settings in the appropriate auxiliary files.
- Avoid introducing dependencies without documenting their installation.
- Test platform-specific path changes.
- Do not commit personal credentials, private paths, or machine-specific configuration data.
- Include reproduction steps for bug reports.

For larger changes, describe the problem, proposed solution, compatibility impact, and validation steps in the pull request.

## License

**License: Not yet specified.**
