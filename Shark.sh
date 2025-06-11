#!/data/data/com.termux/files/usr/bin/bash

# Installe les paquets nécessaires
pkg update -y
pkg install -y zsh git curl figlet lolcat neofetch cmatrix micro ranger

# Change le shell par défaut en zsh
chsh -s zsh

# Installe Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installe les plugins Zsh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Installe le thème Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Prépare le fichier de config de Neofetch
mkdir -p ~/.config/neofetch
neofetch --print_config > ~/.config/neofetch/config.conf
sed -i 's/^print_user_at_host=.*/print_user_at_host="off"/' ~/.config/neofetch/config.conf
echo 'print_info() { info title "Utilisateur" "Rayfoul@shark-terminal" }' >> ~/.config/neofetch/config.conf

# Prépare la config de Micro
mkdir -p ~/.config/micro
cat > ~/.config/micro/settings.json <<EOF
{
  "colorscheme": "solarized-dark",
  "autosave": true,
  "tabsize": 4,
  "softwrap": true,
  "clipboard": "external"
}
EOF

# Génère .zshrc
cat > ~/.zshrc <<'EOF'
# Instant prompt (Oh My Zsh)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Message de bienvenue stylé
function matrix_intro() {
  cmatrix -b &
  pid=$!
  sleep 2.5
  kill $pid
  clear
}
matrix_intro
clear
date | lolcat
figlet "Secret Lab" | lolcat
neofetch

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)

source $ZSH/oh-my-zsh.sh

# Historique intelligent
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

# Auto-complétion améliorée
autoload -Uz compinit
compinit

# Alias
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias py='python3'
alias pip='pip3'
alias edit='micro ~/.zshrc'
alias back='source ~/.zshrc'
alias new='micro'
alias a='cd'
alias send='github.sh'

# Langue
export LANG=fr_FR.UTF-8

# Powerlevel10k
POWERLEVEL9K_DISABLE_GITSTATUS=true
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

# Compile gitstatus (Powerlevel10k)
cd ~/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus && make

# Message de fin
echo -e "\n\033[1;32m✅ Configuration terminée !\033[0m"
echo "Relance ton terminal, ou tape : exec zsh"
