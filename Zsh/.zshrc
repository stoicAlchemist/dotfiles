# Info: To set configurations for the completion system. This line is setting
#       the filename module to the string passed
# Help: man zshcompsys
#

# It's for when you run compinstall again. It lets compinstall find where it has written out zstyle statements for you last time. This way, you can run compinstall again to update them.
zstyle :compinstall filename "${HOME}/.zshrc"

 # autoload:  The autoload feature is not available in bash, but it is in ksh (korn shell) and zsh. On zsh see man zshbuiltins.
# Functions are called in the same way as any other command. There can be a name conflict between a program and a function. What autoload does is to mark that name as being a function rather than an external program. The function has to be in a file on its own, with the filename the same as the function name. 
autoload -Uz colors vcs_info #promptinit
autoload -Uz compinit
compinit
setopt prompt_subst
# Prompt colors can be better set: https://medium.com/@dpeachesdev/intro-to-zsh-without-oh-my-zsh-part-1-c039de5ee22e
colors # Print prompt with colors if configured
autoload -Uz promptinit
promptinit # Testing if needed

# VCS styling
zstyle ':vcs_info:*' actionformats \
  ' %F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*:*' stagedstr \
  "%F{034}"
zstyle ':vcs_info:*:*' unstagedstr \
  "%F{154}"
zstyle ':vcs_info:*' formats \
  '%F{063}%r %F{142}שׂ%f %F{030}%b%f %m%u%c '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

precmd () {
  vcs_info
  RPROMPT="%(1j,%{$fg[red]%},%{$fg[black]%})(%j)%(0?,%{$fg[black]%},%{$fg[red]%}) [%?]%{$reset_color%} %B%*%b    "
}

# ZLE is the ZSH Line Editor that allows to edit command lines before execute
# Vim mode
zle-keymap-select(){
  RPROMPT="%(1j,%{$fg[red]%},%{$fg[black]%})(%j)%(0?,%{$fg[black]%},%{$fg[red]%}) [%?]%{$reset_color%} %B%*%b"
  [[ $KEYMAP = vicmd ]] && RPROMPT="%{$fg[green]%}CMD%{$reset_color%}%(1j,%{$fg[red]%},%{$fg[black]%})(%j)%(0?,%{$fg[black]%},%{$fg[red]%}) [%?]%{$reset_color%} %B%*%b"
  () { return $__prompt_status }
  zle reset-prompt
}

zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

# Prompt by Angelux
  PROMPT='${vcs_info_msg_0_}%F{031}%1~%{$reset_color%} %(0#,%{$fg[red]%}#,%F{063}%f)%{$reset_color%} '

# Directory stack management
setopt auto_pushd
# Syntax correct
setopt correct_all
unsetopt correct_all
# Save command into history before executing
setopt inc_append_history
setopt share_history
# Automatically complete with first option on tab twice
setopt auto_menu
# Whenever autocomplete occurs, send cursor to the end
setopt always_to_end
# Give options whenever autocomplete is ambiguos
setopt auto_list
# automaticaly expand variables on cd
setopt auto_name_dirs
setopt cdablevars
# remove slash if in autocomplete the user gives imputs
setopt auto_remove_slash
# Add a slash if the autocomplete is a dir name
setopt auto_param_slash
# Prevent alias internally substituted
setopt complete_aliases
# Show options instead of expand on regex autocomplete
setopt glob_complete
# Use cd +2 instead of cd -2 on directory stack
setopt pushdminus
setopt autocd
# Use comments with '#'
setopt interactivecomments
# Do not overwrite files unless >! is used
setopt noclobber
# Save space by ignoring blanks on commands
setopt HIST_REDUCE_BLANKS
# Ignore command on history if prepended with space
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
#setopt EXTENDEDGLOB
# Append history instead of replace
setopt APPEND_HISTORY
# Print error if no match found for autocomplete
setopt NOMATCH
# Notify status of jobs, no need to wait
setopt NOTIFY

# Turn VI mode on
bindkey -v
export KEYTIMEOUT=1

bindkey -M viins 'Ç' vi-cmd-mode
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[1;5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[1;5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab

if [[ $TERM_PROGRAM == 'rxvt' ]]
then
  # for rxvt
  bindkey "\e[7~" beginning-of-line # Home
  bindkey "\e[8~" end-of-line # End
fi

# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

if [[ $OSTYPE == 'freebsd' ]]
then
  # for freebsd console
  bindkey "\e[H" beginning-of-line
  bindkey "\e[F" end-of-line
fi

# for <ctrl>+r history search
bindkey "^R" history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

# History
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# vim key bindings
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# My Alias

# Force tmux to use 256 colors
alias tmux='tmux -u -2'

alias nc='nocorrect'
alias grep='grep --color=auto'

if [[ $OSTYPE == "darwin"* ]]
then
  alias ctags="`brew --prefix`/bin/ctags"
  alias ls='exa'
  alias ll='exa -la'
  alias cat='bat'
fi

alias dh='dirs -v' # Print Dir Stack
alias suvim='sudo vim'
alias sucat='sudo cat'
alias psa='ps auxw'
alias :Qa='exit'
alias :qa='exit'
alias :q='exit'
alias :e='nvim'

alias git="nocorrect git"
alias vim="nocorrect vim"
alias nvim="nocorrect nvim"
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# My exports

export EDITOR="nvim"
export SUDO_EDITOR='rnvim'
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000000
export PATH=/usr/local/sbin:~/.cargo/bin:~/bin:$PATH:.:~/.gopath/bin
export GOPATH=~/.gopath

# exports needed for correct locale in NVIM
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Less Colors for Man Pages
# export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           # end mode
# export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
# #export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_so=$'\E[31m'    # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
# Man colors with syntas is better with BAT: https://github.com/sharkdp/bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Tmux and vim colors in terminal depend on this variable, make sure Tmux
# conf and this are in sync
export TERM=screen-256color

# Syntax highlighting
. ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggestions FISH-Shell style
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# CD to Root of a Git repo
fpath=($HOME/.zsh/cd-gitroot/ $fpath)
autoload -Uz cd-gitroot
alias cdg=cd-gitroot

# For solarized theme, use the following config for suggestions
#typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
bindkey -M viins '^e' end-of-line # Yes, I know, it's an emacs "Chord"

if [[ $TERM_PROGRAM == "iTerm.app" ]]; then

  if [ ! -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
    curl -L https://iterm2.com/shell_integration/zsh \
      -o ~/.iterm2_shell_integration.zsh
  fi
  . "${HOME}/.iterm2_shell_integration.zsh"
fi

# fzf for fuzzy finding
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
else
  echo 'FZF script for ZSH not found, please install it visiting https://github.com/junegunn/fzf'
fi
# Use fd instead of find
if (( $+commands[fd] )); then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

# Hooks and functions
function chpwd() {
  if [ -r $PWD/.env ]; then
    source $PWD/.env
  fi
}


fpath=(~/.zsh/completion $fpath)

# Mac needs this after a reboot
ssh-add --apple-use-keychain &> /dev/null

# Docker Compose
alias dcomp="docker-compose"
alias k="kubectl"

if [ -f $(brew --prefix asdf)/libexec/asdf.sh ]; then
  export ASDF_DIR="$(brew --prefix asdf)/libexec"
  # ASDF version manager
  . $(brew --prefix asdf)/libexec/asdf.sh
else
  echo 'WARNING!! asdf version manager not installed!!!'
fi

# If there is a file called .zshcontext on your home dir, load it. This file should hold
# custom code that should be loaded in the current computer
if [ -r $HOME/.zshcontext ]; then
  source $HOME/.zshcontext
fi

# Zplug, plugin manager, set ZPLUG variables to check if it exists
export ZPLUG_HOME=$(brew --prefix zplug)

if [ -r $ZPLUG_HOME/init.zsh ]; then
  source $ZPLUG_HOME/init.zsh
  # Zplug plugins
  zplug "djui/alias-tips"
  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load # Load all the plugins then
else
  echo 'WARNING!! ZPlug is not installed, plugins not loaded'
fi

# Don't tell me to change behaviour on homebrew
export HOMEBREW_NO_ENV_HINTS=true
