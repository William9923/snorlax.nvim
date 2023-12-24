<p align="center"><img width=200" src="./docs/snorlax.png"></p>

<h4 align="center">
  <a href="https://lazyvim.github.io/installation">Installation</a>
  ·
  <a href="https://lazyvim.github.io/configuration">Keymaps</a>
  ·
  <a href="https://lazyvim.github.io">Recipes</a>
</h4>

<p align="center"><b>💤 Snorlax.nvim: Personal lazyvim customization</b></p>

<p align="center">
  </p>

<div align="center"><p>
    <a href="https://github.com/william9923/snorlax.nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/william9923/snorlax.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/william9923/snorlax.nvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/william9923/snorlax.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/ellisonleao/gruvbox.nvim">
     <img alt="Colorscheme"
     src="https://img.shields.io/badge/color-gruvbox-brown?style=for-the-badge" />

    </a>
    <img alt="Git" src="https://img.shields.io/badge/git-lazygit-pink?style=for-the-badge&logo=git" />
    <img alt="Workflow Manager" src="https://img.shields.io/badge/multiplexer-tmux-1BB91F?style=for-the-badge&logo=tmux" />
</p></div>

<p align="center">Snorlax.nvim is a neovim setup customization from <a href="https://github.com/LazyVim/LazyVim">lazyvim</a> for easier customization and better config maintenance.</p>

<p align="center">Designed with same workflow as <a href="https://github.com/William9923/gyarados.nvim">gyarados.nvim</a> as my previous neovim configuration, but with better maintainability from with a lot of pre-configured setup by lazyvim</p>

<p align="center">
    <img src="docs/nvim-file-dashboard.png"/>
</p>

## Getting Started

### Features

<div align="center">
  <p><strong>Your editor. Your style.</strong></p>
  <p>The unified editor preference provide a clutter-free and fluidly coding experience.</p>
</div>

<p align="center">
  <p><strong>Syntax Highlighting</strong></p>
  <img src="docs/treesitter.png" />
</p>

<p align="center">
  <p><strong>Language Server (Definition, Reference, etc...)</strong></p>
  <img src="docs/lspsaga.png" />
</p>

<p align="center">
  <p><strong>Telescope (file finder)</strong></p>
  <img src="docs/telescope.png" />
</p>

<p align="center">
  <p><strong>Workspace diagnostic</strong></p>
  <img src="docs/diagnostic.png" />
</p>

<p align="center">
  <p><strong>File Tree viewer</strong></p>
  <img src="docs/tree-viewer.png" />
</p>

<p align="center">
  <p><strong>Symbol Outline</strong></p>
  <img src="docs/outline.png" />
</p>

<p align="center">
  <p><strong>TODO</strong></p>
  <img src="docs/Todo.png" />
</p>


### Quick Start

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

We will also need `ripgrep` for Telescope to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```
  
Tree-sitter setup
  ```sh 
  :TSInstall all
  ```
  
## Fonts

I personally like Jetbrains Mono Nerd Font, but the font is not defined in the neovim setting. You should configure it in your terminal settings.

## Configuration

### Formatters and linters

In this neovim configuration, I provided some of the formatters and linters that I personally use:

- Prettier : for javascript and typescript
- Black : for Python
- Stylua : for Lua script
- Goimports : for Golang
- Shfmt : for shell scripts

You can configure new formatters and linters easily in `lua/user/lsp`

## Thanks to...

- [LunarVim](https://github.com/LunarVim/nvim-basic-ide)

## ❤️ Support

If you feel that this repo have helped you provide more example on learning software engineering, then it is enough for me! Wanna contribute more? Please ⭐ this repo so other can see it too!
