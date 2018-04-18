# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# to get vim to look nice
set -x TERM xterm-256color

# shorthands
alias py=python3" >> ~/.zshrc
alias py2=python2" >> ~/.zshrc
