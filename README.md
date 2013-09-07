dotfiles
========

My collection of dotfiles used across my computers. Repository structure inspired by [Jamie Wong's dotfiles](https://github.com/phleet/dotfiles/).

Currently contains:

- A uniform colour scheme for all the things using [kantan](https://github.com/pushrax/kantan)
- vim:
  - [Vundle](https://github.com/gmarik/vundle)
  - Useful filetype settings and syntax highlighting
  - [CtrlP.vim](https://github.com/kien/ctrlp.vim) with [matcher](https://github.com/burke/matcher) for fuzzy finding files
  - Verbose statusline
  - Tabs appear as `▸   ` and trailing spaces as `·`
  - Working fileencodings
- zsh:
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  - A verbose prompt, with git information and using vi bindings
- xterm:
  - UTF-8 enabled
  - nice fonts
  - ibus for foreign language input
- git:
  - Useful aliases, like a pretty `g lg` and `g sync` (see .gitconfig)
- tmux with a functional basic configuration (C-a prefix)
- mpd + ncmpcpp for awesome music
- and more!

Feel free to reuse any tidbits in your own configuration!


Usage
-----

- Install git, GNU Make, and a C compiler (for matcher)
- Clone the repository (probably after forking it)
    - If on a server, use `git clone -b servers` to prevent getting unnecessary files
- `cd dotfiles` and `make` (this will automatically fetch submodules and install vim bundles)

