# Show current directory in command prompt, truncating where it can
# https://stackoverflow.com/questions/25090295/how-to-you-configure-the-command-prompt-in-linux-to-show-current-directory
#export PS1="[%~]%% "
#export PS1="[%20<...<%~%<<] "
# https://unix.stackexchange.com/questions/273529/shorten-path-in-zsh-prompt
#export PS1="[%(5~|…/%3~|%~)]%% "
export PS1="[%(5~|%-1~/…/%3~|%4~)]%% "

# Enable Option-Arrow Word jumping
# iterm
bindkey "\e\e[D" backward-word # ⌥←
bindkey "\e\e[C" forward-word # ⌥→
# kitty
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
WORDCHARS=

# ZSH AUTOCOMPLETE
autoload -Uz compinit && compinit -u

# NVIM ALIAS
alias nv=nvim

# ZSH HISTORY
# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# RIPGREP
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# NVM & NPM - commented out when not in use as this initialization step is slow on my poor little Macbook Air
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export PYENV_VERSION=3.9.4
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)" # PYENV-VIRTUALENV - not using currently, in favor of pyenv-virtualenvwrapper
fi  # adds ~/.pyenv/shims to the beginning of PATH

# # PYENV-VIRTUALENVWRAPPER
# # Initalize virtualenvwrapper so commands are available
pyenv virtualenvwrapper
# # This is the default, but prefer explicit over implicit
# export WORKON_HOME=$HOME/.virtualenvs

# POETRY
# This gets put in ~/.profile by the installer, but moved it here
export PATH=$PATH:$HOME/.poetry/bin

# RUST-CARGO
# This gets put in ~/.profile by the installer, but moved it here
export PATH="$HOME/.cargo/bin:$PATH"

# This is the default, but prefer explicit over implicit
export GOPATH=$HOME/go

# Make your binary executables available anywhere on the machine 
export PATH=$PATH:$GOPATH/bin

# Added automatically by sdkman
# Seems to work fine even if it is not at the end of .zshrc, I assume it just doesn't want the PATH
# getting pre-empted by something else that would put another SDK ahead of the sdkman ones
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/franco/.sdkman"
[[ -s "/Users/franco/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/franco/.sdkman/bin/sdkman-init.sh"

neofetch

echo $PATH
