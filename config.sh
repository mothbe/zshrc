ZSH_COMPDUMP=${HOME}/.zcompdump
autoload -Uz compinit
compinit -u -d "${ZSH_COMPDUMP}"

# Custom PATH for MacOS
if [[ "$OSTYPE" == (darwin)* ]]; then
  export PATH=$PATH:$HOME/Library/Python/3.7/bin
fi
