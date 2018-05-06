
CWD=$(pwd)
NWD=$(dirname $0)
# change directory 
printf " === Change Directory (%s)\n" $NWD;
cd $NWD


function setup_dotfile() { 
    echo $1
}

#setup_dotfile .bashrc

bashrc=$(cat ~/.bash_profile | grep $(pwd)/.bashrc)
if [[ -z $bashrc ]]; then
    echo " === installing .bashrc"
    echo "" >> ~/.bash_profile
    echo "# this file added automatically by " >> ~/.bash_profile
    echo "# https://github.com/butuzov/.dotfiles" >> ~/.bash_profile
    echo "source \"$(pwd)/.bashrc\"" >> ~/.bash_profile
fi
# .bashrc >> .bash_profile





printf " === Restoring Directory (%s)\n" $CWD;
cd $CWD