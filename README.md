# 简介

dotvim是一种高效的管理Vim配置及插件的方式。
本项目要求使用Vim 8.x或neovim，采用[minpac][2]管理以下插件：

- aklt/plantuml-syntax
- altercation/vim-colors-solarized
- ekalinin/Dockerfile.vim
- ervandew/supertab
- godlygeek/tabular
- kien/ctrlp.vim
- tpope/vim-commentary
- tpope/vim-fugitive
- tpope/vim-repeat
- tpope/vim-surround
- tpope/vim-unimpaired
- tpope/vim-dispatch
- tpope/vim-obsession
- vim-scripts/dbext.vim
- editorconfig/editorconfig-vim
- vim-airline/vim-airline

添加或更新插件时需要执行：

    :source %
    :PackUpdate

## MacOS X及Unix安装方法

请使用以下命令将dotvim克隆到本地

    git clone --recurse-submodules https://github.com/schnell18/dotvim ~/.vim

如果克隆的时候忘记了__--recurse-submodules__ 选项，那么可以执行以补救：

    git submodule update --init

然后请创建符号链接，指向home目录下的.vim/vimrc文件:

    ln -s ~/.vim/vimrc ~/.vimrc

## Windows安装方法

Windows上安装dotvim和Unix类似。但你需要将dotvim项目克隆到*vimfiles*
子目录下。并且将vimrc文件拷贝到\_vimrc。以下是Windows版的命令：

    cd c:\Users\xxx
    git clone --recurse-submodules https://github.com/schnell18/dotvim vimfiles
    copy vimfiles\vimrc _vimrc

如果克隆的时候忘记了__--recurse-submodules__ 选项，那么可以执行以补救：

    git submodule update --init

为支持状态栏显示效果，建议安装[JetBrains Mono字体][1]。

[1]: https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip?_ga=2.103728128.1800442937.1621155411-1838272988.1619453891
