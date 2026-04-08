# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/Users/stormcat/.zsh/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

# vim like
bindkey -v

if [ -e /opt/homebrew/bin/brew ]; then
  export PATH=$PATH:/opt/homebrew/bin
fi

# aliases
source ~/.zsh_alias

# mise
eval "$(mise activate zsh)"

# zsh基本設定
export LANG=ja_JP.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 前方一致履歴検索（入力中の文字に一致する履歴のみを↑/↓で表示）
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end  # ↑キー
bindkey "^[[B" history-beginning-search-forward-end   # ↓キー
bindkey "^P" history-beginning-search-backward-end    # Ctrl+P
bindkey "^N" history-beginning-search-forward-end     # Ctrl+N

# brewでインスコしたやつのzsh補完リンク設定
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -Uz compinit && compinit

# zsh: no matches found対策
setopt nonomatch

# cd無しでcd
setopt auto_cd

# cdでタブするとディレクトリ一覧を表示
setopt auto_pushd

# UTF-8環境での日本語対応
setopt print_eight_bit

# スペルチェック(nyae)禁止
unsetopt correct_all

# 補完候補を詰める
setopt list_packed

# カッコの補完
setopt auto_param_keys

# ディレクトリ名補完で末尾にスラッシュを付与
setopt auto_param_slash

# プログラム関連の設定をロード
if [ -e ~/.zsh_program ]; then
    source ~/.zsh_program
fi

# Go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

# その端末固有の設定をロードする
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

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

# Terminal settings
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  # ghosttyで動作時
  export TERM='xterm-ghostty'

  # vim modeでのカーソル形状変更
  function zle-keymap-select {
    case $KEYMAP in
      vicmd) print -n '\e[1 q';;      # コマンドモード: ブロックカーソル
      viins|main) print -n '\e[5 q';; # 挿入モード: 点滅バーカーソル
    esac
  }
  zle -N zle-keymap-select

  # 行編集開始時に挿入モードカーソルにリセット
  function zle-line-init {
    print -n '\e[5 q'
  }
  zle -N zle-line-init

  # OSC 7: ディレクトリ変更をターミナルに通知（新規タブで同じディレクトリを開く機能）
  function _ghostty_osc7 {
    printf '\e]7;file://%s%s\e\\' "${HOST}" "${PWD}"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook chpwd _ghostty_osc7
  _ghostty_osc7  # 初回実行
else
  export TERM='xterm-256color'
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config" 

# editor
export EDITOR='nvim'

# Claude Code
export CLAUDE_CODE_EFFORT_LEVEL='max'
# direnv(requires EDITOR)
eval "$(direnv hook zsh)"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source ~/.cargo/env
fi

# atuin
eval "$(atuin init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"


# pnpm
export PNPM_HOME="/Users/stormcat/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/stormcat/.config/.dart-cli-completion/zsh-config.zsh ]] && . /Users/stormcat/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Pub
PUB_CACHE="$HOME/.pub-cache"
if [ -d "$PUB_CACHE" ]; then
  export PATH=$PATH:$PUB_CACHE/bin
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/stormcat/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# bun completions
[ -s "/Users/stormcat/.bun/_bun" ] && source "/Users/stormcat/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='bun "/Users/stormcat/.claude/plugins/cache/thedotmack/claude-mem/10.5.2/scripts/worker-service.cjs"'
