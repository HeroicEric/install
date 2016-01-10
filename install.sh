#!/usr/bin/env bash

# Installs homebrew
# If you don't already have command line tools installed, you will be asked to install them. You should.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh my zsh (You’ll need to enter your password)
ssh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Switch current terminal to zsh
zsh

# Source zsh config
source "$HOME/.zshrc"

brew install chruby
brew install ruby-install
ruby-install ruby 2.2

# Set default ruby version
echo "ruby-2.2" > "$HOME/.ruby-version"

gem install bundler rubygems-bundler --no-document
gem regenerate_binstubs

# Not needed if using my dotfiles
# echo "source /usr/local/share/chruby/chruby.sh" >> "$HOME/.zshrc"
# echo "source /usr/local/share/chruby/auto.sh" >> "$HOME/.zshrc"

# Crack some more brews
brew install heroku-toolbelt
brew install hub
brew install phantomjs
brew install the_silver_searcher
brew install vim

# Install PostgreSQL
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install NVM and Node
brew install nvm
# Not needed if using my dotfiles
# echo "export NVM_DIR=~/.nvm" >> "$HOME/.zshrc"
# echo "source $(brew --prefix nvm)/nvm.sh" >> "$HOME/.zshrc"
nvm install node
nvm alias default node

# Install Redis
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
