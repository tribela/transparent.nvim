# transparent.nvim

If you love transparent term, but your favourite Neovim color scheme doesn't

If your are vim (Not neovim) user, Use [vim-transparent][] instead.

[vim-transparent]: https://github.com/tribela/vim-transparent


# Screenshots

Without transparent.nvim (example color scheme is [eva01][])

![eva01 without transparent](https://github.com/tribela/vim-transparent/assets/5047683/09e18e7f-7a01-4b3b-a11a-021d53a36fe7)

With vim-transparent

![eva01 with transparent](https://github.com/tribela/vim-transparent/assets/5047683/b72cb2ba-60b9-4348-84d3-f91c35cffe3c)


[eva01]: https://github.com/hachy/eva01.vim


## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'tribela/transparent.nvim',
    event = 'VimEnter',
    config = true,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vimrc
Plug 'tribela/transparent.nvim'

lua << EOF
require('transparent').setup({})
EOF
```


## Configuration

```lua
{
    auto = true, -- Automatically applies transparent
    extra_groups = {}, -- If you want to add some groups to be transparent. eg: { 'Pmenu', 'CocFloating' }
    excludes = {}, -- If you want to excludes from default transparent groups. eg: { 'LineNr' }
}
```

## Usage

transparent.nvim automatically transparent all of highlight settings.

You can disable it by `:TransparentDisable` and re-enable it by `:TransparentEnable`, Toggle it by `:TransparentToggle`
