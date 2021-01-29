## Update & upgrade packages, install new firmware
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

## Install tmux
sudo apt-get -y install tmux

## Install zsh
sudo apt-get -y install git zsh

## Install oh-my-zsh & powerlevel10k & fonts
sudo apt-get -y install fonts-powerline

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

### Enable oh-my-zsh plugins & correct theme
#vim ~/.zshrc
#plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
#sed -i 's/(?<=^plugins\=)\"(.*?)\"/(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
#ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
#sed -i 's/(?<=^ZSH_THEME\=)\"(.*?)\"/\"powerlevel10k/powerlevel10k\"/g' ~/.zshrc

#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

## Install tmux config
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

## Change default sheel to zsh
sudo chsh $USER -s $(which zsh)

## Add custom aliases
### Add missing PATH
echo 'export PATH=$PATH:/usr/local/sbin:/sbin' >>~/.zshrc

### Colorize the ls output
echo "alias ls='ls --color=auto'" >>~/.zshrc

### Use a long listing format
echo "alias ll='ls --color=auto -la'" >>~/.zshrc

### Show hidden files
echo "alias l.='ls -d .* --color=auto'" >>~/.zshrc

echo "alias grep='grep --color'" >>~/.zshrc

## Add shutdown command
echo "alias poweroff='sudo shutdown -h -P now'" >>~/.zshrc

exec zsh