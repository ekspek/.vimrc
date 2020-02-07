# Set the terminal style to match suckless
export TERM=st-256color

# Disable oh-my-zsh custom folder check
export ZSH_DISABLE_COMPFIX=true

# Path to the oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Get the path for the dotfiles folder
export DOTFILES=$HOME/dotfiles

# Custom oh-my-zsh folder
export ZSH_CUSTOM=$DOTFILES/.oh-my-zsh/custom

# Set name of the theme to load
ZSH_THEME="kolo"

# Set the random candidates (if ZSH_THEME is set to "random")
# Used as a storage for themes that I like
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "gnzh" "jnrowe" "nanotech" )

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Load plugins
plugins=(git svn gitignore zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Load base16-shell (remember to git clone first)
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_default-dark

# Custom aliases
# Local aliases should be written in .zshenv
source $DOTFILES/.aliases

# Add current working directory to PATH
export PATH=$PATH:.

# Set SVN default editor
export SVN_EDITOR=nvim

# Code to run SVN plugin with zsh themes
prompt_svn() {
	local rev branch
	if in_svn; then
		rev=$(svn_get_rev_nr)
		branch=$(svn_get_branch_name)
		if [[ $(svn_dirty_choose_pwd 1 0) -eq 1 ]]; then
			prompt_segment yellow black
			echo -n "$rev@$branch"
			echo -n "±"
		else
			prompt_segment green black
			echo -n "$rev@$branch"
		fi
	fi
}
build_prompt() {
	RETVAL=$?
	prompt_status
	prompt_context
	prompt_dir
	prompt_git
	prompt_svn
	prompt_end
}

# Remove hostname from zsh theme
prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		#prompt_segment black default "%(!.%{%F{yellow}%}.)$USER" # Comment this line to remove username
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
