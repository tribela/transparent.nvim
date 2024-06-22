# transparent.nvim

If you love transparent term, but your favourite Neovim color scheme doesn't

If your are vim (Not neovim) user, Use [vim-transparent][] instead.

[vim-transparent]: https://github.com/tribela/vim-transparent


# Screenshots

With transparent.nvim (example color scheme is [eva01][])

![eva01 theme with transparent.nvim](https://github.com/tribela/transparent.nvim/assets/5047683/d02f95f8-a0ba-4d95-8343-4a202d660681)


Without vim-transparent

![eva01 theme without transparent.nvim](https://github.com/tribela/transparent.nvim/assets/5047683/01609fbb-acd2-4bff-b697-afbe90482f2e)


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
