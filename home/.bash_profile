if [ -f ~/.bashrc ]; then
  source ~/.bashrc
else
  echo "Could not find ~/.bashrc"
fi

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
