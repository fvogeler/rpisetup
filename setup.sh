## Update & upgrade packages, install new firmware
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

## Install tmux
sudo apt-get install tmux

## Install zsh
sudo apt-get install git zsh

## Install powerlevel10k & fonts
sudo apt-get install fonts-powerline

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

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
echo "alias poweroff='sudo shutdown -h -P now'" >>~/.zshrc

### Colorize the ls output
echo "alias ls='ls --color=auto'" >>~/.zshrc

### Use a long listing format
echo "alias ll='ls -la'" >>~/.zshrc

### Show hidden files
echo "alias l.='ls -d .* --color=auto'" >>~/.zshrc

echo "alias grep='grep --color'" >>~/.zshrc

## Add shutdown command
echo "alias shutdown=''" >>~/.zshrc



exec zsh