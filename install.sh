#!/usr/bin/env bash

export VIM_REPO="https://github.com/michimawan/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"

# fix some flacky when on home
cd /tmp

# clean up
if [ -d $VIM_DIR ]; then
  rm -rf $VIM_DIR
fi
if [ -d $VIM_INSTALL_DIR ]; then
  rm -rf $VIM_INSTALL_DIR
fi

git clone $VIM_REPO $VIM_INSTALL_DIR;
curl -fLo "${VIM_INSTALL_DIR}/.vim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symlinks
ln -sf "${VIM_INSTALL_DIR}/.vim" $VIM_DIR
ln -sf "${VIM_INSTALL_DIR}/.vimrc" ~/.vimrc
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ~/.gvimrc


# Install bundle with Plug
/usr/bin/vim +PlugInstall +qall
