# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.

export MY_SCRIPTS=$HOME/.scripts/

export ANDROID_HOME=/opt/android-sdk

export ANDROID_SDK_ROOT=$ANDROID_HOME

export GRADLE_HOME=/opt/gradle-6.7.1

export ZSH=$HOME/.oh-my-zsh

export FLUTTER=/opt/flutter/bin 

export PATH=$HOME/bin:/usr/local/bin:$SNAP:$ANDROID_HOME:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin:$PATH

export PATH=$HOME/.pub-cache/bin:$FLUTTER:$PATH

export PATH=$MY_SCRIPTS:$PATH


# My Theme
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable correction
ENABLE_CORRECTION="false"

# My plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_BIN="$NVM_DIR/versions/node/v12.16.1/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


######################## Alias Definition ########################


# Clean gradle much logs files
alias clean_gradle="find ~/.gradle -name '*.log' -exec rm {} \;"
alias clean_cache="find ~/.cache -depth -type f -mtime +365 -delete"

# Add flutter fvm alias
#alias flutter="fvm flutter"
#alias dart="fvm dart"

# Add JBang to environment
alias j!=jbang
