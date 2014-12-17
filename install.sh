#!/usr/bin/env bash

# Installs homebrew
# If you don't already have command line tools installed, you will be asked to install them. You should.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh my zsh (You’ll need to enter your password)
curl -L http://install.ohmyz.sh | sh

# Switch current terminal to zsh
zsh

# Source zsh config
source "$HOME/.zshrc"

brew install chruby
brew install ruby-install
ruby-install ruby 2.1.5

# Set default ruby version
echo "ruby-2.1.5" > "$HOME/.ruby-version"

gem install rubygems-bundler —no-document
gem regenerate_binstubs

echo "source /usr/local/share/chruby/chruby.sh" >> "$HOME/.zshrc"
echo "source /usr/local/share/chruby/auto.sh" >> "$HOME/.zshrc"

# Crack some more brews
brew install heroku-toolbelt
brew install hub
brew install phantomjs
brew install redis
brew install the_silver_searcher
brew install vim

# Install PostgreSQL
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install NVM and Node
brew install nvm
echo "export NVM_DIR=~/.nvm" >> "$HOME/.zshrc"
echo "source $(brew --prefix nvm)/nvm.sh" >> "$HOME/.zshrc"
nvm install 0.10
nvm alias default 0.10

# Casks
brew install caskroom/cask/brew-cask
brew cask install alfred
brew cask alfred link
brew cask install atom
brew cask install dropbox
brew cask install flux
brew cask install github
brew cask install gitter
brew cask install google-chrome
brew cask install iterm2
brew cask install mailbox
brew cask install slack
brew cask install slate
brew cask install spotify
brew cask install vlc
