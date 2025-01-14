ZSH_COMPDUMP=${HOME}/.zcompdump
autoload -Uz compinit
#source <(kubectl completion zsh)

compinit -u -d "${ZSH_COMPDUMP}"

# Custom PATH for MacOS
if [[ "$OSTYPE" == (darwin)* ]]; then
  export PATH=$PATH:$HOME/Library/Python/3.7/bin
fi


export HOMEBREW_PREFIX="$(brew --prefix)"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
