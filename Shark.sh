#!/data/data/com.termux/files/usr/bin/bash

# Mise à jour
echo " Mise à jour de Termux..." | lolcat
sleep 1
pkg update -y && pkg upgrade -y

# Installation des paquets nécessaires
echo " Installation des dépendances..." | lolcat
sleep 1
pkg install -y zsh git curl neofetch figlet lolcat cmatrix micro

# Installation de Oh My Zsh
echo " Installation du bureau ZSH..." | lolcat
sleep 1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Définir Zsh comme shell par défaut
chsh -s zsh

# Définir ZSH_CUSTOM
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Installer les plugins Zsh
echo " Installation des plugins ZSH..." | lolcat
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Installer Powerlevel10k
echo -e "\e[92m[+] Clonage de Powerlevel10k...\e[0m"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Fichier .zshrc
ZSHRC="$HOME/.zshrc"

if [ -f "$ZSHRC" ]; then
  echo -e "\e[92m[+] Mise à jour du fichier .zshrc avec le thème Powerlevel10k...\e[0m"
  # Remplacer l'ancien thème
  if grep -q '^ZSH_THEME=' "$ZSHRC"; then
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
  else
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
  fi
else
  echo -e "\e[92m[+] Création du fichier .zshrc avec le thème Powerlevel10k...\e[0m"
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' > "$ZSHRC"
fi

# Activer les plugins
sed -i 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)/' "$ZSHRC"

# Ajouter message de bienvenue et alias
cat << 'EOF' >> "$ZSHRC"

# Nettoyage et bienvenue
clear
date | lolcat
figlet "Secret Lab" | lolcat
neofetch

# Alias utiles
alias update='pkg update && pkg upgrade -y'
alias cls='clear'
alias edit='micro ~/.zshrc'
alias a='cd'
alias back='source ~/.zshrc'
EOF

echo
echo -e "\e[92m Installation terminée ! Relance Termux ou tape \e[1mzsh\e[0m pour activer la configuration.\e[0m"
echo -e " Ensuite, exécute \e[1mp10k configure\e[0m pour personnaliser Powerlevel10k.\e[0m"
