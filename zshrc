# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/marcin/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey '^R' history-incremental-search-backward

setopt COMPLETE_ALIASES
# prompt walters
# PROMPT='%F{152}%2~%f %# '
export PROMPT='%F{152}$USER: %F{152}%2~%f %# '

autoload -Uz run-help-git
# autoload -Uz run-help-ip
# autoload -Uz run-help-openssl
# autoload -Uz run-help-p4
# autoload -Uz run-help-sudo
# autoload -Uz run-help-svk
# autoload -Uz run-help-svn

# fpath=("$HOME/.red-zsh/themes" "$fpath[@]")

# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%b'

#https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)'
# zstyle ':vcs_info:git:*' formats '%F{green}(%b)%r%f'
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git
