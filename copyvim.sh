#!/bin/bash
mkdir ~/.config/nvim/
cp .vimrc ~/
cp .vimrc ~/.config/nvim/init.vim
cp .vimrc ~/.vimmrc
sed -i.bak '/YouCompleteMe/d' ~/.vimmrc
sed -i.bak '/clang_complete/d' ~/.vimmrc
sed -i.bak '/easytags/d' ~/.vimmrc
