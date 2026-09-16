# KMKLabs Vim Config

Vim configuration for Ruby, TypeScript/Next.js, and Python development.

## Requirements

- Vim with `+ruby` support. Ubuntu's standard `vim` package may lack Ruby
  support; `vim-nox` provides it:

  ```sh
  sudo apt install vim-nox
  ```

- Ruby and the matching development headers:

  ```sh
  sudo apt install ruby ruby-dev
  ```

- The Silver Searcher (`ag`) for project search:

  ```sh
  sudo apt install silversearcher-ag
  ```

- [fzf](https://github.com/junegunn/fzf), available on your `PATH`.

- ripgrep (`rg`) for fzf.vim's `:Rg` command:

  ```sh
  sudo apt install ripgrep
  ```

Check Vim and Ruby support with:

```sh
vim --version | grep ruby
vim --cmd 'ruby puts RUBY_DESCRIPTION' --cmd 'q'
```

The Vim Ruby version and system Ruby version should match. Use `rbenv` or
`rvm` if you need to select a matching Ruby.

## Install

Clone this repository and link the Vim files into your home directory:

```sh
git clone --branch custom https://github.com/michimawan/vim-config.git ~/.vim-config
ln -sfn ~/.vim-config/.vim ~/.vim
ln -sfn ~/.vim-config/.vimrc ~/.vimrc
ln -sfn ~/.vim-config/.gvimrc ~/.gvimrc
```

Install [vim-plug](https://github.com/junegunn/vim-plug), then install the
plugins from inside Vim:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/0.14.0/plug.vim
vim +PlugInstall +qall
```

If the config reports `E492: Not an editor command: Plug`, vim-plug is missing.
Run the `curl` command above and repeat `vim +PlugInstall +qall`.

Command-T is pinned to version 4 for classic Vim. Its plugin hook compiles the
Ruby extension during `:PlugInstall`. If it needs to be rebuilt manually:

```sh
cd ~/.vim/plugged/command-t/ruby/command-t
ruby extconf.rb
make
```

Do not run `sudo make install`; Command-T is loaded from the Vim plugin
directory.

## Shortcuts

`<Leader>` is Vim's default `\` key. This config does not set a custom leader.
`<C-x>` means hold Ctrl and press x; `\\` means press `\` twice.

### Daily workflow

- `\\s`: start EasyMotion bidirectional character search, press the target character, then press the displayed label
- `<C-p>` / `<C-b>`: find files / open buffers with Command-T
- `:Rg query`: search the project with ripgrep
- `g/` / `g*`: search with `ag` / search the word under the cursor
- `]c` / `[c`: next / previous GitGutter hunk; `\hp`: preview the hunk
- `\g` / `\G`: toggle NERDTree / find the current file in NERDTree
- `\.`: toggle Tagbar
- `:A` (Ruby only): open the alternate Rails file, such as implementation ↔ matching spec
- `\rc` / `\rn`: run the current / nearest RSpec test
- `cs`, `ds`, `ys`: change, delete, or add a surround

Single-leader custom mappings remain active, for example `\t` opens FZF.
EasyMotion begins with `\\`: use `\\s` for bidirectional character search or
`\\t{char}` to jump just before the next target character.

### Everyday navigation and search

- `<Leader>t`: open fzf
- `gn` / `gp`: next / previous result; `gq`: close results; `gl`: show the results window
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: move between splits

### Project and view

- `<Leader>rt`: regenerate tags with ctags

### Rails and RSpec

- `<Leader>oc`, `<Leader>ov`, `<Leader>om`, `<Leader>oh`, `<Leader>oj`, `<Leader>os`, `<Leader>oi`: open Rails controller, view, model, helper, JavaScript, stylesheet, or integration test
- `<Leader>rl`, `<Leader>ra`: run the last or all RSpec tests

### Editing and cleanup

- `<Leader>c`: remove trailing whitespace; `<Leader>I`: reindent the file
- `<Leader><Space>`: clear search highlighting
- `<C-Up>` / `<C-Down>`: move lines up / down

### Utility

- `gs`, `gr`, `gm`: open Rails schema, routes, or Gemfile
- `<Leader>w` / `<Leader>W`: toggle / disable line wrapping
- GitGutter automatically shows uncommitted line changes in the sign column; no shortcut is required.
