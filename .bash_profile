# .bash_profile

# Homebrewで入れたvimを使うようにPATHを追加
export PATH="/usr/local/bin:$PATH"

# Stack install
#export PATH="$HOME/.local/bin:$PATH"

# Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

# CMake
export PATH="/Applications/CMake.app/Contents/bin:$PATH"

## Pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# Nodebrew
#export PATH="$HOME/.nodebrew/current/bin:$PATH"
#export NODEBREW_ROOT="/usr/local/var/nodebrew"
#export PATH="$NODEBREW_ROOT/current/bin:$PATH"

# Google cloud
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# Read .basrc
source ~/.bashrc
