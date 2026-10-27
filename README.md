# vimsettings

Vim settings split in two so the everyday editor stays close to stock Vim.

| File | Where it applies | Purpose |
|---|---|---|
| `.vimrc` | Everywhere, including bare boxes | Plain display and text settings. No plugins, no external tools, no custom keys, no colors. |
| `.vim/code.vim` | Laptop only | Syntax highlighting, color scheme, ripgrep for `:grep`, vim-go settings. |

## Design rules

- A setting that changes a key or command behavior stays out of `.vimrc`. Remote boxes should behave like stock Vim.
- A setting that only changes what you see or what gets inserted (ruler, line numbers, indent width) belongs in `.vimrc`.
- A setting that needs a tool or file that may not exist (`rg`, a color scheme, a plugin) belongs in `code.vim`.

## Install on the laptop

Symlink the two files. Link them individually rather than the whole `~/.vim`, so
swap files, `.netrwhist`, and third-party code stay out of the repo.

```sh
mkdir -p ~/.vim
ln -s "$PWD/.vimrc" ~/.vimrc
ln -s "$PWD/.vim/code.vim" ~/.vim/code.vim
```

Move any existing `~/.vimrc` aside first, since `ln -s` will not overwrite it.

## Install on a bare box

Copy only the base file:

```sh
scp .vimrc host:~/.vimrc
```

Or paste its contents into `~/.vimrc`. Do not copy `code.vim`.

## Dependencies for `code.vim`

None of these are tracked in this repo. Every one degrades gracefully if missing,
except `rg`, which `:grep` needs.

### ripgrep

`:grep` uses `rg` (`grepprg`/`grepformat` in `code.vim`).

```sh
brew install ripgrep
```

Usage: `:grep pattern dir`, then `:copen` to browse results. Do not pass `-rn`;
in `rg`, `-r` means `--replace`.

### monokai color scheme

Upstream: <https://github.com/crusoexia/vim-monokai> (MIT).

```sh
curl -fLo ~/.vim/colors/monokai.vim --create-dirs \
  https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim
```

`code.vim` uses `silent! colorscheme monokai`, so a missing file falls back to the
default scheme instead of erroring. The scheme exits silently if `&t_Co < 256`;
check with `:echo &t_Co`.

### vim-go

Upstream: <https://github.com/fatih/vim-go>. Installed with Vim's native package
system (`pack/*/start/`), so no plugin manager is needed. Pinned to the commit
that was tested (26 commits past `v1.29`).

```sh
git clone https://github.com/fatih/vim-go ~/.vim/pack/plugins/start/vim-go
git -C ~/.vim/pack/plugins/start/vim-go checkout e6788d12
```

Then, once per machine, start Vim and run:

```vim
:GoInstallBinaries
```

This installs the Go tools vim-go depends on (`gopls`, `goimports`, and others) via
`go install`, so Go must be installed and on `PATH`. Use `:GoUpdateBinaries` to
update them later.

The `g:go_*` lines in `code.vim` do nothing without vim-go and are harmless if it
is missing.
