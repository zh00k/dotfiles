# =========================
# Basic shell setup
# =========================
autoload -U colors && colors
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# Completion
autoload -Uz compinit
compinit

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# =========================
# Git prompt helpers
# =========================
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
  branch=$(git rev-parse --short HEAD 2>/dev/null) || return
  echo " [%{$fg[magenta]%}${branch}%{$reset_color%}]"
}

typeset -g _prompt_newline_first=1

precmd() {
  if [[ -z ${_prompt_newline_first:-} ]]; then
    print ""
  else
    unset _prompt_newline_first
  fi
}

# =========================
# Prompt
# =========================
local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"

local path_p="%{$fg[green]%}%~%{$reset_color%}"
local user_host="${blue_op}%n@%m : ${path_p}${blue_cp}"
local user_time=" ${blue_op}%{$fg[blue]%}%T%{$reset_color%}${blue_cp}"

PROMPT="┌${user_time} ${user_host} $(git_branch)
└─> "

local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "

# =========================
# Aliases
# =========================
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# =========================
# Plugins
# =========================
source "$HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
