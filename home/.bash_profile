if [ -f ~/.bashrc ]; then
  source ~/.bashrc
else
  echo "Could not find ~/.bashrc"
fi

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
