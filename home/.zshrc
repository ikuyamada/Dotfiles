HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

PROMPT="%B%n@%m%%%b "
RPROMPT="%B[%~]%b"
setopt transient_rprompt

bindkey -e

setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt append_history
setopt inc_append_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^V" edit-command-line

setopt auto_pushd
setopt auto_menu
setopt hist_verify
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt print_eight_bit
setopt pushd_ignore_dups

# disable Ctrl-s
stty stop undef

autoload -U compinit
compinit -u
autoload -U colors
colors
alias sudo='env PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin sudo'
alias du="du -h"
alias df="df -h"
alias ll="ls -lh"
alias la="ls -a"
alias ta="tmux attach"
alias taa="tmux -CC attach"
alias p="popd"
alias py="ipython"
alias g="grep --binary-files=without-match --colour=always -r --exclude=\*.svn\* --exclude=\*.git\* --exclude=\*.venv\* --exclude=\*.mypy_cache\*"
alias venv="source .venv/bin/activate"

case ${OSTYPE} in
    darwin*)
        alias ls="ls -G -w"
        alias vim="subl"
        ;;
    linux*)
        alias ls="ls --color"
        settitle() {
            printf "\033k$1\033\\"
        }
        ssh() {
            settitle "$*"
            command ssh "$@"
            settitle "zsh"
        }
        ;;
esac
