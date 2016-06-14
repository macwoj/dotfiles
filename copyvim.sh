#!/bin/bash
cp .vimrc ~/
cp .vimrc ~/.vimmrc
sed -i.bak '/YouCompleteMe/d' ~/.vimmrc
sed -i.bak '/easytags/d' ~/.vimmrc
