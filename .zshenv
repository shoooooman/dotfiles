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

# gnuplot
export PATH=/Applications/gnuplot.app:/Applications/gnuplot.app/bin:$PATH

export PATH=$PATH:~/.nodebrew/current/bin

# tex関連
# export PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-darwin

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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# locale
export LC_ALL=en_US.UTF-8
