dotfiles
========

My collection of unix dotfiles used across my computers.
Repository structure inspired by [Jamie Wong's dotfiles](https://github.com/phleet/dotfiles/).
Feel free to reuse any tidbits in your own configuration!

There are two modes: `light` and `full`, differing mainly in the complexity of dependencies.

Usage
-----

Install dependencies:

- git
- vim (vim-nox on ~Debian)
- GNU Make
- some kind of Ruby

The `full` mode also requires:

- a C/C++ compiler (likely clang)
- CMake
- Python (+dev)

Once that's done:

- clone the repository
- `cd dotfiles`
- `make` (light) or `make full`

This is idempotent, so it can be run each time the repository is updated.

