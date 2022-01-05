# Installation and Configuration #

## Prerequisites: ##
* Xcode 12+ 
* Cocoapods installed 
* Git installed 
* Ruby installed 
* Homebrew installed
* iOS cloned project

Clone iOS project from Gitlab:  https://github.com/sagaya/League.git
Open terminal and navigate to the project directory.

**Install cocoapods -** 
From terminal type: 
* $ Bundle exec pod install 
**NOTE:** all commands for the project must be run with bundle exec

**Troubleshooting Ruby installation issues**

* $ gem list --local | grep cocoapods | awk '{print $1}' | xargs sudo gem uninstall -> remove all existing cocoapod installation
* $ sudo gem uninstall -aIx -> remove the existing gem installation from local mac

* $ brew install rbenv ruby-build
In terminal do the following steps
* $ touch ~/.zshrc --> To make sure file is created
* $ open ~/.zshrc --> Open the file
  * add the following line if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi at the end of file.
  * Save and close the file.
* $ source ~/.zshrc -> to add it in the shell
* $ rbenv install 2.6.3
* $ rbenv global 2.6.3
* $ ruby -v --> to check it's updated
* $ which gem
  * It will surely show /Users/<youruser>/.rbenv/shims/gem
Install cocoapods from scratch
* $ sudo gem install -n /usr/local/bin cocoapods
* $ pod setup
Final step install pods
* $ bundle exec pod install

