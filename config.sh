ZSH_COMPDUMP=${HOME}/.zcompdump
autoload -Uz compinit
if [ ! -f ${ZSH_COMPDUMP} ]; then
  echo "File not exists ${ZSH_COMPDUMP}"
  compinit -d "${ZSH_COMPDUMP}"
fi


if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ${ZSH_COMPDUMP}) ]; then
  echo "Old data in ${ZSH_COMPDUMP}"
  compinit -d "${ZSH_COMPDUMP}"
else
  compinit -u -C -d "${ZSH_COMPDUMP}"
fi
