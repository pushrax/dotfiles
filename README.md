dotfiles
========

My collection of unix dotfiles used across my computers.
Repository structure inspired by [Jamie Wong's dotfiles](https://github.com/phleet/dotfiles/).
Feel free to reuse any tidbits in your own configuration!


Usage
-----

- Install git, vim (vim-nox on Debian based distros), GNU Make, and a C compiler (for matcher)
- Clone the repository
- `cd dotfiles` and `make`. This will automatically fetch submodules and install vim bundles.
This is idempotent, so it can be run each time the repository is updated.

