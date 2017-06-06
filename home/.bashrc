
# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

#Add RVM to PATH
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH="/Users/meganboudreau/go/"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/Users/meganboudreau/Library/Android/sdk/platform-tools/
export GOROOT="/usr/local/Cellar/go/1.7.3/libexec/"
export PATH="$PATH:$GOROOT/bin"

. ~/.bash_profile

export PATH="$HOME/.yarn/bin:$PATH"
