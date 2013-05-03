all: submodules kantan-build matcher link

matcher:
	cd matcher; make

kantan-build:
	cd kantan; ./kantan schemes/default

link: .zsh .zshrc .vim .vimrc .gitconfig .gitignore_global .tmux.conf
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~; )

submodules:
	git submodule init
	git submodule update

