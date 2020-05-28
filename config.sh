ZSH_COMPDUMP=${HOME}/.zcompdump
autoload -Uz compinit
compinit -d "${ZSH_COMPDUMP}"

# Custom PATH for MacOS
if [[ "$OSTYPE" == (darwin)* ]]; then
  export PATH=$PATH:/Users/marcin/Library/Python/3.7/bin
fi
