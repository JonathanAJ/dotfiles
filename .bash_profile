if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
 exec startx
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/jonathan.jardim@bh01.local/.dart-cli-completion/bash-config.bash ] && . /home/jonathan.jardim@bh01.local/.dart-cli-completion/bash-config.bash || true
## [/Completion]



# Added by Antigravity CLI installer
export PATH="/home/jonathan.jardim@bh01.local/.local/bin:$PATH"
