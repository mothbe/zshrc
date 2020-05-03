ZSH_COMPDUMP=${HOME}/.zcompdump
autoload -Uz compinit
compinit -d "${ZSH_COMPDUMP}"

# Custom PATH for MacOS
if [[ "$OSTYPE" == (darwin)* ]]; then
  export PATH=$PATH:/Users/mwitowski/Library/Python/2.7/bin/:/Users/mwitowski/Library/Python/2.7/bin
fi
