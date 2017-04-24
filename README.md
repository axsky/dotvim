# README
## Quickstart
```shell
cd ~
git clone git@github.com:axsky/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init #--recursive
```
## Config
Make sure all submodules have been pushed before pushing the parent repo:
#### Option 1:
```shell
git config --global push.recurseSubmodules check
```
#### Option 2:
```shell
git push --recurse-submodules=on-demand
```
## Upgrade all plugins
#### Option 1:
```shell
cd ~/.vim
git submodule foreach git pull origin master
```
#### Option 2:
```shell
cd ~/.vim
git pull --recurse-submodules
```
## Add a plugin as a git submodule
```shell
cd ~/.vim/bundle
git submodule add https://github.com/tpope/vim-fugitive.git
# git commit, etc
```
## Remove a plugin
```shell
cd ~/.vim
git rm bundle/vim-fugitive
rm -rf .git/modules/vim-fugitive
```
