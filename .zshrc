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
  # 🔎 Sugere aliases para comandos que você usa frequentemente
  alias-finder  # Exemplo: digita `git status` e ele sugere criar um alias gs='git status'

  # 📦 Plugin para usar comandos do Ansible com autocompletar
  ansible  # Exemplo: digita `ansible-<TAB>` e ele completa módulos e hosts

  # 📚 Gerenciador de versões para várias linguagens (Node, Elixir, Ruby etc.)
  asdf  # Exemplo: `asdf install nodejs 18.16.0`

  # 🔔 Notificação desktop ao término de comandos demorados
  bgnotify  # Exemplo: roda `bundle install` e ele te avisa quando terminar

  # 💎 Comandos úteis para projetos Ruby que usam bundler
  bundler  # Exemplo: `bundle exec rspec` pode ser completado ou encurtado

  # 🖼️ Mostra imagens diretamente no terminal (X11/Kitty)
  catimg  # Exemplo: `catimg imagem.png` exibe a imagem no terminal

  # ❗ Mostra sugestão de pacotes quando você digita um comando inexistente
  command-not-found  # Exemplo: digita `htop` sem instalar → ele sugere como instalar

  # 📋 Comando `copyfile` para copiar arquivos com mais facilidade
  copyfile  # Exemplo: `copyfile arquivo.txt ~/backup/`

  # 🔁 Alterna entre diretórios visitados com `cd -`
  dircycle  # Exemplo: `cd -` vai trocando entre os últimos diretórios acessados

  # 🐳 Autocompletar e atalhos para docker
  docker  # Exemplo: digita `docker co<TAB>` → completa `docker container`

  # 🐙 Autocompletar para docker-compose
  docker-compose  # Exemplo: `docker-compose up -d` com autocompletar de serviços

  # 🗜️ Extrai arquivos de qualquer tipo (zip, tar.gz, rar, etc.)
  extract  # Exemplo: `extract arquivo.tar.gz`

  # 🧬 Comandos e autocompletar para Git
  git  # Exemplo: `gst` = `git status`, `gco` = `git checkout`

  # 🧠 Mostra branch e status do git no prompt
  git-prompt  # Exemplo: `main*` aparece no terminal quando você está numa branch

  # 🧾 Gera `.gitignore` com base na linguagem
  gitignore  # Exemplo: `gi ruby` cria um gitignore para Ruby

  # 📊 Ferramentas para manipular JSON no terminal
  jsontools  # Exemplo: `ppjson arquivo.json` formata o JSON

  # 📂 Comando `jump` para pular rapidamente para pastas acessadas antes
  jump  # Exemplo: `jump projeto` vai direto para ~/Documentos/projetos/rails-projeto

  # 🔣 Permite usar um caractere só como atalho para comandos
  singlechar  # Exemplo: define `g` para `git status`, `d` para `docker ps`, etc.

  # 📤 Upload rápido de arquivos com curl via sprunge
  sprunge  # Exemplo: `echo "texto" | sprunge` → retorna URL

  # 📤 Envia arquivos para outros via `transfer.sh`
  transfer  # Exemplo: `transfer arquivo.txt` → URL para baixar

  # 🌐 Busca no Google, DuckDuckGo, Bing direto do terminal
  web-search  # Exemplo: `google ruby lambda function`

  # 🔍 Autocompletar fuzzy (aproximado) no terminal
  fzf  # Exemplo: `Ctrl+R` → busca interativa no histórico

  # 📁 Mostra visualmente os diretórios ao navegar com `cd`
  zsh-interactive-cd  # Exemplo: `cd` e ele lista opções navegáveis

  # 🎨 Realce de sintaxe de comandos (erros, strings, variáveis)
  zsh-syntax-highlighting  # Exemplo: `cat " -> destaca erro de sintaxe

  # 💡 Sugere o que você *provavelmente* quer digitar com base no histórico
  zsh-autosuggestions  # Exemplo: digita `gi` → ele completa com `git status` em cinza

  # 💎 Comandos úteis para Ruby
  ruby  # Exemplo: digita `irb` e ele sugere opções

  # 🔧 Comandos úteis para Rails
  rails  # Exemplo: `rake db:migrate` e `rails s` com autocomplete

  # 🐍 Autocompletar e utilitários Python
  python  # Exemplo: `python` ou `pip` com sugestões

  # 📦 Complementa o pip (instalador de pacotes Python)
  pip  # Exemplo: digita `pip ins<TAB>` → completa `install`

  # 🔢 Comandos para Node.js
  node  # Exemplo: `node -v` ou `node script.js`

  # 📦 Comandos para gerenciar pacotes com npm
  npm  # Exemplo: `npm init`, `npm install express` com autocomplete

  # 🤯 Corrige comandos errados digitados
  # thefuck  # Exemplo: digita `git branchh` → ele sugere `git branch`

  # ⌨️ Busca no histórico por substring (↑ e ↓)
  history-substring-search  # Exemplo: digita `ss` e ↑ para buscar `ssh`, `sso`, etc.

  # 📂 Plugin `z`: acessa diretórios com base em frequência/recência
  z  # Exemplo: `z projetos` → vai para `~/Documentos/projetos`
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

# ====== Atalhos para histórico com substring (↑ ↓ filtrados) ======
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ====== Caminho extra para scripts pessoais (se houver) ======
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# ====== Inicialização silenciosa de nvm (se usar Node via nvm) ======
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ====== Plugin z para acesso rápido a diretórios usados ======
[ -f "$ZSH_CUSTOM/plugins/z/z.sh" ] && source "$ZSH_CUSTOM/plugins/z/z.sh"
