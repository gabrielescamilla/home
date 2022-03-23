Change the keyboard to Dvorak
Update OS
Install iTerm

Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Unzip your .ssh into your home folder

Install
	From browser links:
	Citrix receiver.

Self service
  Azure Data Studio
  Okta ScaleFT agent

	From app store:
	xcode

		
	From web:
	docker.
	rectangle.
	rubymine.
	intellij.

# System Configuration
- Switch Caps lock key
- Configure biometric reader
 
# Google
- create google account for your office if you don't have one
- add homepage
- add open pages on start to chrome

# Homebrew
brew doctor
brew intsall:
- git # Test this with a known repo it should work with your ssh in place.(platdev)
- zsh
- azure-cli
- ripgrep
  rg --version
  rg some .
- fzf
  /usr/local/opt/fzf/install
  source ~/.zshrcwd
  shell
- autoconf
  
- curl
- tmux
- tmuxp
- fd
- libpq
- postgresql <- needed for headers for gem pg 1.2.3 
- brew install --cask phantomjs <- needed for autobahn

 
# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
chmod +X ~/.asdf/completions/asdf.bash
chmod +x ~/.asdf/completions/asdf.bash
ls -ali ~/.asdf/completions
source ~/.zshrc

export ASDF_PYTHON_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch?full_index=1"\


asdf plugn-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.7.4
asdf global ruby 2.7.4
asdf plugin-add elixir
asdf install elixir 1.11.4-otp-22
asdf global elixir 1.11.4-otp-22
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
 1647276659:0;asdf install nodejs 14.18.3
asdf global nodejs 14.18.
asdf global nodejs 14.18.3
npm install --global yarn

ln -s /Users/gescamilla/.home/zsh/.zshrc /Users/gescamilla/.zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.prezto"
cd .prezto
vim init.zsh
source .zshrc
./.zprezto/init.zsh
chsh -s $(which zsh)
source ~/.zprezto/init.zsh
prompt -p giddie
prompt -p kylewest
prompt -p minimal
prompt -p nicoulaj
prompt -p paradox
prompt -p peepcode
prompt -l
prompt -p powerlevel10k
prompt -p powerline
prompt -p pure

git config --global use.email "gescamilla@covermymeds.com"
git conig --global user.name "Gabriel Escamilla"
echo "export EDITOR=/usr/bin/vim" >> /etc/profile
sudo echo "export EDITOR=/usr/bin/vim" >> /etc/profile


erlang
ruby
python


ln -s ~/.home/vimrc ./.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Repos (put them in a script)
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git


