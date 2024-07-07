# Buildfix.nvim

A simple Neovim plugin to execute a build command with optional prefix and suffix.

## Features

- Execute a custom build command
- Option to run the build command on file save
- Configurable keybinding
- Integration with Neovim's notification system

### Installation

Using [packer.nvim](https:##github.com#wbthomason#packer.nvim):

```lua
use {
  'gashon/buildfix.nvim',
  config = function()
    require('buildfix').setup()
  end
}
```

Using [lazy.nvim](https:##github.com#folke#lazy.nvim):

```lua
{
  'gashon/buildfix.nvim',
  config = true
}
```

### Configuration

Default configuration:

```lua
require('buildfix').setup({
  command = "buildfix",
  suffix = "",
  fix_on_save = false,
  keymap = "<leader>bf",
})
```

## Usage

- Use the `:Buildfix` command to execute the build command
- Use the configured keymap (default: `<leader>bf`) to execute the build command
- If `fix_on_save` is set to `true`, the build command will run on each file save

### API

`require('buildfix').setup(opts)`
Configures the plugin. `opts` is a table with the following fields:

- `command` (string): The build command to execute
- `suffix` (string): Suffix to append to the command
- `fix_on_save` (boolean): Whether to run the command on file save
- `keymap` (string): Keymap to execute the build command

### License

This project is licensed under the APACHE License - see the [LICENSE](LICENSE) file for details.
