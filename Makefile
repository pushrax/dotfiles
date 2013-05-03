all: submodules kantan-build Xresources matcher link

matcher:
	cd matcher; make

kantan-build:
	cd kantan; ./kantan schemes/default

Xresources:
	cat .Xresources > ~/.Xresources
	cat kantan/output/Xresources >> ~/.Xresources

.mpd:
	mkdir -p .mpd/playlists
	touch .mpd/mpd.{db,log,pid,state}

link: .zsh .zshrc .vim .vimrc .gitconfig .gitignore_global .inputrc .tmux.conf .mpd .mpdconf .xbindkeysrc .xinitrc .ncmpcpp .slate .mpv
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~; )

submodules:
	git submodule init
	git submodule update

