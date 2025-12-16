# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export PATH="${HOME}/.cargo/bin:${HOME}/go/bin:${HOME}/local/bin:${HOME}/local/go/bin:${PATH}"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export LANG=en_US.utf8
