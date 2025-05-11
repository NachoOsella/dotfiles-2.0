# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
eval "$(starship init zsh)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="gruvbox"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#



export HYPRSHOT_DIR=/home/nacho/Documents/imagenes/screenshots/
export QT_QPA_PLATFORMTHEME=qt5ct
export MOZ_ENABLE_WAYLAND=1



alias fastfetch='fastfetch --logo-padding-top 3'
alias icat="kitten icat"
alias volumen="pactl set-sink-volume @DEFAULT_SINK@"
alias paquetes="pacman -Q | wc -l"
alias ya='yazi'
alias zathura="setsid zathura"
alias bateria="cat /sys/class/power_supply/BAT0/capacity"

# zoxide
eval "$(zoxide init zsh)"

mnew() {
  # Pide cada parámetro y guarda en variables
  read "GROUPID?GroupId (ej: com.nacho): "
  read "ARTIFACTID?ArtifactId (ej: miapp): "
  read "ARCHETYPE?Archetype (default maven-archetype-quickstart): "
  # Si no escribís archetype, usa el quickstart
  ARCHETYPE=${ARCHETYPE:-maven-archetype-quickstart}
  # Opción extra para versión si querés
  read "VERSION?Version (default 1.0-SNAPSHOT): "
  VERSION=${VERSION:-1.0-SNAPSHOT}
  # Ejecuta mvn con los parámetros
  mvn archetype:generate \
    -DgroupId="$GROUPID" \
    -DartifactId="$ARTIFACTID" \
    -DarchetypeArtifactId="$ARCHETYPE" \
    -Dversion="$VERSION" \
    -DinteractiveMode=false
}

facu() {
  git config user.name "412023-OSELLA"
  git config user.email "412023@tecnicatura.frc.utn.edu.ar"
  echo "👉 Git configurado como: $(git config user.name) <$(git config user.email)>"
}


# gclone: clona usando la cuenta 1 ó 2 sin tener que tocar manualmente la URL
function gclone() {
  if (( $# != 2 )); then
    echo "Uso: gclone 1|2 <ssh-url>"
    return 1
  fi

  local acc=$1
  local url=$2
  local hostalias

  case $acc in
    1) hostalias="github.com-cuenta1" ;;
    2) hostalias="github.com-cuenta2" ;;
    *)
      echo "Cuenta inválida: elegí 1 o 2"
      return 1
      ;;
  esac

  # Reemplazo simple: git@github.com → git@github.com-cuentaX
  local newurl="${url/git@github.com/git@${hostalias}}"

  echo "🔄 Clonando con la cuenta ${acc}:"
  echo "    → $newurl"
  git clone "$newurl"
}

function runmvn() {
    if [ $# -ne 1 ]; then
        echo "Uso: runmvn com.tu.paquete.Main"
        return 1
    fi

    local MAIN_CLASS="$1"
    local PROJECT_PATH="$PWD"

    echo "📁 Proyecto en: $PROJECT_PATH"
    echo "🧹 Limpiando..."
    mvn clean

    echo "⚙️ Compilando..."
    mvn compile

    echo "🚀 Ejecutando clase principal: $MAIN_CLASS"
    mvn exec:java -Dexec.mainClass="$MAIN_CLASS"
}


function mic () {
    # ejecutar el comando pactl para cambiar el input del microfono
    pactl set-source-port alsa_input.pci-0000_00_1f.3.analog-stereo analog-input-headset-mic
    echo "Micrófono cambiado a headset"
}



