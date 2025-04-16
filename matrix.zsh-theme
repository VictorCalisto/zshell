# MATRIX — tema estilo terminal verde fosforescente

autoload -Uz vcs_info

# Cores
FG_GREEN='%F{green}'
FG_RED='%F{red}'
FG_YELLOW='%F{yellow}'
FG_BLUE='%F{blue}'
FG_RESET='%f'
BOLD='%B'
NORMAL='%b'

# Símbolos
PROMPT_SYMBOL='╰─$'
RETVAL_SYMBOL='↵'
GIT_BRANCH_ICON='‹'
LANG_TAG_ICON='‹'
LANG_END_ICON='›'

# Função: branch atual do Git
parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  echo "${GIT_BRANCH_ICON}${branch}${LANG_END_ICON}"
}

# Função: linguagem predominante no projeto, na ordem: Ruby > Python > JS > Java
detect_language() {
  local lang=""
  local version=""

  # Ruby
  if [[ -f ".ruby-version" ]]; then
    version=$(<.ruby-version)
    lang="ruby-$version"

  # Python
  elif [[ -n $(find . -maxdepth 1 -name "*.py" 2>/dev/null) || -f "requirements.txt" ]]; then
    if command -v python3 &>/dev/null; then
      version=$(python3 --version 2>&1 | awk '{print $2}')
    fi
    lang="python${version:+-$version}"

  # Node.js (JavaScript)
  elif [[ -f "package.json" ]]; then
    if command -v node &>/dev/null; then
      version=$(node -v 2>/dev/null | sed 's/^v//')
    fi
    lang="nodejs${version:+-$version}"

  # Java
  elif [[ -n $(find . -maxdepth 1 -name "*.java" 2>/dev/null) || -f "pom.xml" ]]; then
    if command -v java &>/dev/null; then
      version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    fi
    lang="java${version:+-$version}"
  fi

  [[ -n "$lang" ]] && echo "${LANG_TAG_ICON}${lang}${FG_GREEN}${LANG_END_ICON}"
}


# Atualiza o prompt antes de cada comando
precmd() {
  vcs_info
  local ret=$?

  local user_host="${FG_GREEN}${BOLD}%n@%m${NORMAL}"
  local cwd="${FG_GREEN}%~${FG_RESET}"
  local git_branch=$(parse_git_branch)
  [[ -n "$git_branch" ]] && git_branch="${FG_RED}${git_branch}${FG_RESET}"
  local lang_info=$(detect_language)

  # Linha 1: info principal
  PROMPT=$'╭─'"${user_host} ${cwd} ${git_branch} ${lang_info}"$'\n'

  # Linha 2: prompt principal
  PROMPT+="${FG_GREEN}${PROMPT_SYMBOL}${FG_RESET} "
  [[ $ret -ne 0 ]] && PROMPT+="${FG_RED}${RETVAL_SYMBOL}${FG_RESET} "

  RPROMPT=''
}

# Garante que o precmd seja executado corretamente
autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd
