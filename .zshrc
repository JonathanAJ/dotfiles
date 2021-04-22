# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.

export JAVA_HOME=/opt/jdk-8

export ANDROID_HOME=/opt/android-sdk

export ANDROID_SDK_ROOT=$ANDROID_HOME

export GRADLE_HOME=/opt/gradle-6.7.1

export FLUTTER_HOME=/opt/flutter

export SNAP=/snap/bin

export PATH=$HOME/bin:/usr/local/bin:$SNAP:$JAVA_HOME/bin:$ANDROID_HOME:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin:$FLUTTER_HOME/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

# My Theme
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable correction
ENABLE_CORRECTION="true"

# My plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export NVM_DIR="/home/jonathanaj/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
prompt_context(){}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
