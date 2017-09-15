UNAME := $(shell uname)

LN_FLAGS := -s
ifeq ($(UNAME), Linux)
	LN_FLAGS := $(LN_FLAGS) -T
else ifeq ($(UNAME), Darwin)
	LN_FLAGS := $(LN_FLAGS) -h
endif

light: submodules kantan-build fzf-setup link vim-light pluginstall

full: submodules kantan-build Xresources fzf-setup link vim-full pluginstall

fzf-setup:
	@./fzf/install --bin

kantan-build:
	@cd kantan; bash kantan schemes/default

Xresources:
	@cat .Xresources kantan/output/Xresources > ~/.Xresources

.mpd:
	@mkdir -p .mpd/playlists
	@touch .mpd/mpd.{db,log,pid,state}

link: \
	.zsh .zshenv .vim .gvimrc .tmux.conf .tmux-osx.conf \
	.gitconfig .gitignore_global .inputrc \
	.ctags .mpd .mpdconf .ncmpcpp .mpv \
	.xbindkeysrc .xinitrc .slate

	@mkdir -p ~/.config
	@$(foreach file, $^, rm -f ~/$(file); )
	@$(foreach file, $^, ln $(LN_FLAGS) $(CURDIR)/$(file) ~/$(file); )

vim-common:
	@rm -f ~/.vimrc ~/.vimrc.common
	@ln $(LN_FLAGS) "$(CURDIR)/.vimrc" ~/.vimrc.common

vim-light: vim-common
	@echo "let g:use_light_conf=1\nsource ~/.vimrc.common" > ~/.vimrc

vim-full: vim-common
	@echo "let g:use_light_conf=0\nsource ~/.vimrc.common" > ~/.vimrc

pluginstall:
	@mkdir -p .vim/plugins
	vim +PlugInstall +qall

submodules:
	@git submodule sync
	@git submodule update --init --recursive

