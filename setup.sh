#!/bin/bash

if [[ $@ == *"--install"* ]]; then  
	# installing tools
	sudo apt update
	sudo apt install i3 btop xdotool rofi polybar neovim docker.io git maim xclip zsh ripgrep -y
 	# nvim & plugins etc
    rm ~/.config/nvim/init.vim
    mkdir ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	vim +'PlugInstall' +qa
	# diff-so-fancy
	cd ~/.local/share
	git clone https://github.com/so-fancy/diff-so-fancy.git
 	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
	git config --global interactive.diffFilter "diff-so-fancy --patch"
	git config --global color.ui true

	git config --global color.diff-highlight.oldNormal    "red bold"
	git config --global color.diff-highlight.oldHighlight "red bold 52"
	git config --global color.diff-highlight.newNormal    "green bold"
	git config --global color.diff-highlight.newHighlight "green bold 22"

	git config --global color.diff.meta       "11"
	git config --global color.diff.frag       "magenta bold"
	git config --global color.diff.func       "146 bold"
	git config --global color.diff.commit     "yellow bold"
	git config --global color.diff.old        "red bold"
	git config --global color.diff.new        "green bold"
	git config --global color.diff.whitespace "red reverse"
	cd ~/workplace
	## vs code
	sudo apt-get install wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code # or code-insiders
		
	## flutter
	mkdir ~/development
	cd ~/development
	git clone https://github.com/flutter/flutter.git -b stable
	echo 'export PATH="$PATH:~/development/flutter/bin"' >> ~/.zshrc
	. ~/zshrc
	flutter channel master
	flutter upgrade
	cd 
	## android studio
	cd ~/development
	wget 'https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.1.21/android-studio-2022.1.1.21-linux.tar.gz'
	tar -xf android-studio-2022.1.1.21-linux.tar.gz
	sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386	
	rm android-studio-2022.1.1.21-linux.tar.gz
	echo 'export PATH="$PATH:~/development/android-studio/bin"' >> ~/.zshrc
	cd ~/workplace

	## google chrome
	
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt-get install -f -y
	rm google-chrome-stable_current_amd64.deb

	sudo apt update -y
	sudo apt upgrade -y
fi 


if [[ $@ == *"--laptop"* ]]; then  
	sudo cp ./alert-battery/alert-battery /usr/local/bin/
	sudo chmod +x /usr/local/bin/alert-battery
	crontab -l >> current-crons
	echo "*/5 * * * * export DISPLAY=:0.0 && /usr/local/bin/alert-battery" >> current-crons
	crontab current-crons
	rm current-crons

fi
# oh my zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# plugins 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# setting up environment
mkdir -p ~/.config
cp -R i3 ~/.config
cp -R polybar ~/.config

# setting up rc's
cat vim/.vimrc > ~/.vimrc
cat bash/.bashrc > ~/.bashrc
cat zsh/.zshrc > ~/.zshrc

# setting up jarvis
if [[ $@ == *"--jarvis"* ]]; then
	cd jarvis && bash ./setup.sh
fi
i3-msg restart
