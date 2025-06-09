#!/data/data/com.termux/files/usr/bin/bash

# Mise à jour
echo "Mise à jour de Termux..."
sleep 1
pkg update -y && pkg upgrade -y

# Installation des paquets nécessaires
echo "Installation de zsh, git, curl, neofetch, et autres programmes nécessaires..."
sleep 1
pkg install -y zsh git curl neofetch figlet lolcat cmatrix micro

# Installer Oh My Zsh
echo "Installation de Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Définir Zsh comme shell par défaut
chsh -s zsh
echo "Paramétrage du système..."
sleep 1

# Appliquer un thème simple
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

# Ajouter message de bienvenue et alias dans ~/.zshrc
cat << 'EOF' >> ~/.zshrc

# Nettoyage et bienvenue
clear
date | lolcat
figlet "Shark" | lolcat
neofetch

# Alias utiles
alias update='pkg update && pkg upgrade -y'
alias cls='clear'
alias edit='micro ~/.zshrc'
EOF

echo
echo -e "\e[92m✅ Installation terminée ! Relance Termux ou tape \e[1mzsh\e[0m pour activer la configuration.\e[0m"
