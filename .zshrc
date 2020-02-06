# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PY_USER_BIN=$(python -c 'import site; print(site.USER_BASE + "/bin")')
export PATH=$PY_USER_BIN:$PATH

# Link to aliases
source $HOME/.aliases

# Enable auto jump
. /usr/share/autojump/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable swift
export PATH=$HOME/Downloads/tools/swift-4.2.1-RELEASE-ubuntu18.04/usr/bin:$PATH
export PATH=$HOME/Downloads/tools/swift-5.0-DEVELOPMENT-SNAPSHOT-2019-01-04-a-ubuntu18.04/usr/bin:$PATH
# Configuration to support Swift development extension (Mintained Swift Development Environment)
# export SOURCEKIT_TOOLCHAIN_PATH=/home/iambeer/Downloads/tools/swift-4.2.1-RELEASE-ubuntu18.04/
# export arm gcc
export PATH=$HOME/Downloads/tools/gcc-arm-none-eabi-8-2018-q4-major/bin:$PATH

# Adding support golang
export GOPATH=$HOME/Documents/golang/apis-dfu-golang/dfu
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
