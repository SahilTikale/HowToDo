#!/usr/bin/bash
#########################################################################
# DESCRIPTION: If you use vi/vim for python coding, then		#
#     running this script will create/append appropriate fileS		#
#     such that vi will 						#
#     -- help put ident after every conditional statement.		#
#     -- replace tabs with white-spaces and 				#
#     -- turn syntax on							#
# CREATED: 2016-05-01 (YYYY-MM-DD)					#
# VERSION: 20160501_1826						#
# AUTHOR: Sahil Tikale							#
#########################################################################

function check_homeDir() {

if [ ${HOME} != ${PWD} ]; then
    echo "ERROR: Not a home directory."
    echo "Run this script from your home directory."
    exit 1
fi
}

function modify_dot_vimrc() {      
cd $HOME
check_homeDir
cat >>.vimrc <<EOF
syntax on
filetype indent plugin on

EOF
}

function create_python.vim() {
cat >>python.vim <<EOF
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

EOF
}


function installPythonCustomization4vim() {

cd $HOME
check_homeDir

if [ -d ".vim" ]; then
    cd .vim
    if [ -d "ftplugin" ]; then
        cd ftplugin; create_python.vim
    else
	echo "could not write to folder : ftplugin "
    fi
else
    mkdir .vim; mkdir .vim/ftplugin
    cd .vim/ftplugin
    create_python.vim
fi
}

main() {
echo "Modifying dot_vimrc"
modify_dot_vimrc

echo "Generating pythom.vim"
installPythonCustomization4vim
}

main
