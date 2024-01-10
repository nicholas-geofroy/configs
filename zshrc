function virtualenv_info {
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘
}

source ~/configs/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme fletcherm
# good themes: fletcherm

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
antigen bundle nvm
antigen bundle kiurchv/asdf.plugin.zsh
antigen bundle docker

antigen apply

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"
eval "$(starship init zsh)"

zstyle ':completion:*' menu select

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup ssh agent
eval "$(ssh-agent -s)" &> /dev/null

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nickgeofroy/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nickgeofroy/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nickgeofroy/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nickgeofroy/bin/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#ssh
ssh-add ~/.ssh/github_ed25519 &> /dev/null

# WSL GUI config
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf &>/dev/null):0 # in WSL 2
export LIBGL_ALWAYS_INDIRECT=1

# local bin
export PATH="$PATH:$HOME/bin"

alias oldvim=vim
alias vi=nvim
alias vim=nvim

alias k=kubectl
