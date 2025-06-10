#!/data/data/com.termux/files/usr/bin/bash

# Mise à jour
echo " Mise à jour de Termux..." | lolcat
sleep 1
pkg update -y && pkg upgrade -y

# Installation des paquets nécessaires
echo "📦 Installation des dépendances..." | lolcat
sleep 1
pkg install -y zsh git curl neofetch figlet lolcat cmatrix micro

# Installation de Oh My Zsh
echo "🎨 Installation du bureau ZSH..." | lolcat
sleep 1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Définir Zsh comme shell par défaut
chsh -s zsh

# Installer les plugins Zsh
echo "🔌 Installation des plugins ZSH..." | lolcat
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Modifier le thème et activer les plugins dans ~/.zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)/' ~/.zshrc

# Ajouter un message de bienvenue et des alias
cat << 'EOF' >> ~/.zshrc

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
echo -e "\e[92m✅ Installation terminée ! Relance Termux ou tape \e[1mzsh\e[0m pour activer la configuration.\e[0m"
