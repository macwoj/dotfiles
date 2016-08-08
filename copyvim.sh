#!/bin/bash
mkdir ~/.config/nvim/
cp .vimrc ~/
cp .vimrc ~/.config/nvim/init.vim
cp .vimrc ~/.vimmrc
sed -i.bak '/Plug.*YouCompleteMe/d' ~/.vimmrc
sed -i.bak '/Plug.*clang_complete/d' ~/.vimmrc
sed -i.bak '/Plug.*deoplete/d' ~/.vimmrc
sed -i.bak '/Plug.*easytags/d' ~/.vimmrc

# sed -i.bak '/Plug.*YouCompleteMe/d' ~/.vimrc
# sed -i.bak '/Plug.*clang_complete/d' ~/.vimrc
# sed -i.bak '/Plug.*deoplete/d' ~/.vimrc
# sed -i.bak '/Plug.*easytags/d' ~/.vimrc
