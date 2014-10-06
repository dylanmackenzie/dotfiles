# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my aliases
if [ -f ~/dotfiles/aliases ]; then
	. ~/dotfiles/aliases
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

set -o vi
