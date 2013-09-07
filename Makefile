all: submodules kantan-build Xresources matcher-build link bundleinstall

matcher-build:
	cd matcher; make

kantan-build:
	cd kantan; bash kantan schemes/default

Xresources:
	cat .Xresources > ~/.Xresources
	cat kantan/output/Xresources >> ~/.Xresources

.mpd:
	mkdir -p .mpd/playlists
	touch .mpd/mpd.{db,log,pid,state}

link: \
	.zsh .zshenv .vim .vimrc .gvimrc .tmux.conf \
	.gitconfig .gitignore_global .inputrc \
	.ctags .mpd .mpdconf .ncmpcpp .mpv \
	.xbindkeysrc .xinitrc .slate .config/powerline

	mkdir -p ~/.config
	-$(foreach file, $^, ln -sT $(CURDIR)/$(file) ~/$(file); )

bundleinstall:
	vim +BundleInstall +qall

submodules:
	git submodule update --init --recursive

