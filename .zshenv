#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PATH=$PATH:~/.nodebrew/current/bin

# tex関連
export PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-darwin

# /usr/sbin
export PATH=$PATH:/usr/sbin

# /usr/local/bin
export PATH=$PATH:/usr/local/bin

# /usr/local/sbin
export PATH=$PATH:/usr/local/sbin

# ~/.local/bin
export PATH=$PATH:~/.local/bin

# pythonライブラリと.local/binをPATHに追加
for DIR in ${HOME}/Library/Python/2.7/bin ${HOME}/.local/bin ; do
        if [ -d ${DIR} ] ; then
                PATH=${PATH}:${DIR}
        fi
done

# pip
export PATH="/usr/local/lib/python2.7/site-packages:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# locale
export LC_ALL=en_US.UTF-8

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO111MODULE="on"
export PATH=$PATH:$GOPATH/bin

# curl-openssl
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"

# plantUML
export PLANTUML_LIMIT_SIZE=8192
