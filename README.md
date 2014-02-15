Linux/Unix Installation
-----------------------
You run the following commands to make the dotvim effective:

    git clone git://github.com/schnell18/dotvim.git ~/.vim
    cd ~/.vim
    git submodule init
    git submodule update

If you are using git 1.6.5 or above, you can simplify above steps in one
go:

    git clone --recurse-submodules git://github.com/schnell18/dotvim.git ~/.vim

If you come across SSL certificate verification error, you may work
around this issue by turning off the verification temporarily:

    export GIT_SSL_NO_VERIFY=true

Then you create a symbol link to the .vim/vimrc file:

    ln -s ~/.vim/vimrc ~/.vimrc

Windows Installation
--------------------
Windows installation is similar except that you clone the project into
*vimfiles* sub directory instead of *.vim* and copy the vimrc file into
\_vimrc instead of soft-linking to *.vimrc* under your home directory.
Here are the commands relevant to Windows for your convenience:

    cd c:\Users\xxx
    git clone --recurse-submodules git://github.com/schnell18/dotvim.git vimfiles
    copy vimfiles\vimrc _vimrc

The vimrc on Windows uses the free Inconsolata font by default, you may
download it from [here][1].

[1]: http://www.levien.com/type/myfonts/Inconsolata.otf. "Inconsolata Font site"
