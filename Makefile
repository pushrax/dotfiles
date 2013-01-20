all: submodules link

link: .vim .vimrc .gitconfig .gitignore_global .inputrc .Xresources
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~; )

submodules:
	git submodule init
	git submodule update

