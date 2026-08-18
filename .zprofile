if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
 exec startx
fi


# Added by Antigravity CLI installer
export PATH="/home/jonathan.jardim@bh01.local/.local/bin:$PATH"
