# vim like
bindkey -v

# aliases
alias ll='ls -lh'
alias la='ls -lha'
alias ls='ls -Gh'

# zsh基本設定
export LANG=ja_JP.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# brewでインスコしたやつのzsh補完リンク設定
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -Uz compinit && compinit



# cd無しでcd
setopt auto_cd

# cdでタブするとディレクトリ一覧を表示
setopt auto_pushd

# UTF-8環境での日本語対応
setopt print_eight_bit

# スペルチェック(nyae)禁止
#setopt correct
#setopt correct_all
unsetopt correct_all

# 補完候補を詰める
setopt list_packed

# カッコの補完
setopt auto_param_keys

# ディレクトリ名補完で末尾にスラッシュを付与
setopt auto_param_slash

# その端末固有の設定をロードする
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

# プロンプトの設定
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

autoload colors
colors
P_CDIR="%B%F{cyan}%~%f%b"
P_INFO="%F{yellow}%n@$LOCAL_NAME%f:"
P_VCS="%F{green}%1v%f"
PROMPT="[$P_INFO$P_CDIR]$P_VCS$ "

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# cdr
#typeset -ga chpwd_functions
#if is-at-least 4.3.11; then
  #autoload -U chpwd_recent_dirs cdr
  #chpwd_functions+=chpwd_recent_dirs
  #zstyle ":chpwd:*" recent-dirs-max 500
  #zstyle ":chpwd:*" recent-dirs-default true
  #zstyle ":completion:*" recent-dirs-insert always
#fi

#zaw
source ~/dotfiles/zaw/zaw.zsh
bindkey '^R' zaw-history
bindkey '^G' zaw-git-branches
bindkey '^U' zaw-gitdir

function zaw-src-gitdir () {
  _dir=$(git rev-parse --show-cdup 2>/dev/null)
  if [ $? -eq 0 ]
  then
    candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                                               '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
  fi
  actions=("zaw-src-gitdir-cd")
  act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
  BUFFER="cd $1"
  zle accept-line
}
zaw-register-src -n gitdir zaw-src-gitdir

# tmuxのプロンプト設定で上書き
#PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
#
export TERM='xterm-256color'

