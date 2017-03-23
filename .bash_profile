alias vi="/usr/local/Cellar/vim/8.0.0459/bin/vim"
alias vimtutor="/usr/local/Cellar/vim/8.0.0459/bin/vimtutor"
alias vim="/usr/local/Cellar/macvim/8.0-127/bin/mvim"
alias tmuxa="tmux a -t"
alias tmuxdelete="tmux kill-session -t"
# git alias
alias gits="git status"
# my varibales
export PATH=$(brew --prefix)/sbin:$(brew --prefix)/bin:$PATH:$HOME/bin
# Save full bash history
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# added by newengsetup
export EDITOR=vi
export PATH=$PATH:$GOPATH/bin
export PS1="\n[\#] \[\033[38;5;14m\]\d\[$(tput bold)\] \t\[$(tput sgr0)\]\[\033[38;5;82m\] \u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;82m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\] \w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty 🍀   \[$(tput sgr0)\]"
[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
[ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh
type "brew" &>/dev/null && [ -s "$(brew --prefix)/etc/bash_completion" ] && . $(brew --prefix)/etc/bash_completion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

gotest () {
    for dir in $(glide novendor); do
	go test -race $dir
	go fix $dir
	done
}

_sync_dir () {
    cmd=$1
    shift
    new_directory=$(boxer sync_dir $@)
    if [ "$?" -eq "0" ]; then
        $cmd $new_directory
    else
        echo "$new_directory"
    fi
}
cdsync () {
    _sync_dir cd $@
}
editsync () {
    _sync_dir $EDITOR $@
}
opensync () {
    _sync_dir open @
}
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
