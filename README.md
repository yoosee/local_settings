# Unix/Linux configuration files in ~ directory

Configuration files for several console apps in ~ directory, such as .zshrc, .vimrc, .muttrc, etc. clone the repos on your ~ directory and rename it to __local__, then execute local/bin/link-dotfiles to setup dot-files into your home directories.

## Commands

### link-dotfiles

link-dotfiles simply create symlink from local/config files to the same name of $HOME/.file_name. Skip link if exists.

