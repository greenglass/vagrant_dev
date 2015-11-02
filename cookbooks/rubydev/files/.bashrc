# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
vi='vim'

export PATH="/opt/packer:$PATH:$HOME/.rvm/bin:$HOME/bin" # Add RVM to PATH for scripting
export EDITOR=vim

#
# AWS Kitchen Configuration

#
# Identifies the AWS keypair with which Kitchen test instances
# will be created.  This needs to match the name of the key pair
# as shown in the EC2 console.
#
export AWS_SSH_KEY_ID=""

#
# Identifies the path to the private key file on your local file system
# associated with the AWS key pair identified by the AWS_SSH_KEY_ID variable.
#
export AWS_SSH_KEY=""

