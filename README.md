Linux/Unix Installation
-----------------------
You run the following commands to make the dotvim effective:

    git clone git://github.com/schnell18/dotvim.git ~/.vim
    cd ~/.vim
    git submodule init
    git submodule update

If you are using git 1.6.5 or above, you can clone the dotvim and submodules in one go:

    git clone --recurse-submodules git://github.com/schnell18/dotvim.git ~/.vim

If you come across SSL certificate verification error, you may work around this issue by turning off the verification temporarily:

    export GIT_SSL_NO_VERIFY=true

Then you create a symbol link to the .vim/vimrc file:

    ln -s ~/.vim/vimrc ~/.vimrc

Windows Installation
--------------------
Windows installation is similar except that you clone the project into vimfiles sub directory of your home directory and copy the vimrc file into \_vimrc under the home directory. The vimrc on Windows uses the free Inconsolata font by default, you may download it from [here][1].

[1]: http://www.levien.com/type/myfonts/Inconsolata.otf. "Inconsolata Font site"
