# Vim2Nvim Pipeline

This vim plugin allows you to build and install neovim from source.

## WARNING

This is a work in progress. (or maybe just a toy project)

It is currently just an experiment, to see if it works.

## Requirements

This has the same prerequisites as the [Neovim build script](https://github.com/neovim/neovim/blob/master/BUILD.md).

Only Linux is supported due to differences in the build process on other platforms.

## Installation

### With Vim-Plug

```vim
Plug 'rootiest/vim2nvim-pipeline'
```

### With Vundle

```vim
Bundle 'rootiest/vim2nvim-pipeline'
```

## Usage

Run `:NeovimBuild` to build and install neovim from source.

> [!CAUTION]
> The Neovim source directory will be cloned into the current working directory.

## See Also

- [Neovim Updater Plugin](https://github.com/rootiest/nvim-updater.nvim)

## License

This repository is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this project in your own work.
