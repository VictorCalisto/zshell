# Caminho para o oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# ==== Corrige o comportamento do Tab para completar corretamente ====
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
# ====================================================================


# Tema leve para personalização manual
ZSH_THEME="matrix"  # Usaremos esse como base e customizamos com cores

# Plugins
plugins=(
  alias-finder
  ansible
  asdf
  bgnotify
  bundler
  catimg
  command-not-found
  copyfile
  dircycle
  docker
  docker-compose
  extract
  git
  git-prompt
  gitignore
  jsontools
  jump
  singlechar
  sprunge
  transfer
  web-search
  fzf
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-autosuggestions
  ruby
  rails
  python
  pip
  node
  npm
  #thefuck
)

source $ZSH/oh-my-zsh.sh

# ====== Aparência Matrix ======

# Cor padrão do terminal: verde fosforescente
autoload -U colors && colors
export PROMPT='%F{green}%n@%m %F{cyan}%~ %F{yellow}→ %f'
export RPROMPT='%F{red}$(git_prompt_info)%f'

# Autocompletar comandos: verde
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'

# Realce de sintaxe: comandos importantes coloridos
# - Comandos válidos: verde
# - Comandos inválidos: vermelho
# - Strings: amarelo
# - Variáveis: azul
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[assign]='fg=blue'

# Mostrar pontos ao aguardar autocomplete
COMPLETION_WAITING_DOTS="%F{yellow}...completando...%f"

# Corrigir comandos automaticamente
ENABLE_CORRECTION="true"

# Histórico com datas
HIST_STAMPS="yyyy-mm-dd"

# Idioma e editor
export LANG=pt_BR.UTF-8
export EDITOR='nvim'

# fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias reload!='exec zsh'
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias reload="source ~/.zshrc"
alias cls="clear"
alias grep="grep --color=auto"
eval $(thefuck --alias)
