function virtualenv_info {
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘
}

source ~/configs/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme random


antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z

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
zstyle ':completion:*' menu select

export PATH=$PATH:/usr/local/go/bin:/home/nickgeofroy/go/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup ssh agent
eval "$(ssh-agent -s)" > /dev/null

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nickgeofroy/bin/google-cloud-sdk/path.bash.inc' ]; then . '/home/nickgeofroy/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nickgeofroy/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/nickgeofroy/bin/google-cloud-sdk/completion.bash.inc'; fi
