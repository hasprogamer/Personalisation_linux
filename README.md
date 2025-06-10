🦈 Termux Personalisation - by Rayfoul

Ce script automatise la personnalisation complète de Termux en installant des outils visuels, un shell amélioré (Zsh), des alias pratiques, et une interface colorée et agréable dès le lancement du terminal.


📅 Installation

Étape 1 : Cloner le dépôt

git clone https://github.com/hasprogamer/Personalisation_linux.git
cd Personalisation_linux
chmod +x install.sh

Étape 2 : Lancer le script

Une fois dans le dossier, lance simplement le script :

./shark.sh
ou
bash shark.sh

💡 Relance Termux ou tape simplement :

zsh


---

🔧 Ce que le script fait automatiquement

🔁 Mise à jour du système

Met à jour tous les paquets existants :



📦 Installe les outils suivants :

Outil	Description

zsh	Shell puissant et moderne
git	Gestion de dépôts Git
curl Téléchargement de scripts à distance
neofetch	Affichage des infos système stylé
figlet	ASCII Art pour les titres
lolcat	Coloration arc-en-ciel du texte
cmatrix	Animation type "Matrix" dans le terminal
micro	Éditeur de texte simple et efficace


🧠 Installe Oh My Zsh

Framework puissant pour personnaliser Zsh.

Change le thème par défaut en agnoster.


🎨 Personnalise ton .zshrc

Ajoute automatiquement :

clear
date | lolcat
figlet "Shark" | lolcat
neofetch

alias update='pkg update && pkg upgrade -y'
alias cls='clear'
alias edit='micro ~/.zshrc'


---

🥺 Résultat après lancement de Termux


/ ___|  ___  ___ _ __ ___| |_  | | __ _| |__ 
\___ \ / _ \/ __| '__/ _ \ __| | |/ _` | '_ \
 ___) |  __/ (__| | |  __/ |_  | | (_| | |_) |
|____/ \___|\___|_|  \___|\__| |_|\__,_|_.__/
                                                                                           -o          o-         
          +hydNNNNdyh+             
        +mMMMMMMMMMMMMm+          
      `dMMm:NMMMMMMN:mMMd`        
      hMMMMMMMMMMMMMMMMMMh      
  ..  yyyyyyyyyyyyyyyyyyyy  ..  
.mMMm`MMMMMMMMMMMMMMMMMMMM`mMMm.
:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:   
:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM: 
:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:  
:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:
-MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM-
 +yy+ MMMMMMMMMMMMMMMMMMMM +yy+
      mMMMMMMMMMMMMMMMMMMm
      `/++MMMMh++hMMMM++/
          MMMMo  oMMMM
          MMMMo  oMMMM
          oNMm-  -mMNs

📅 [ate du jour]   ← colorée avec lolcat
████████████████    ← ASCII Art "Shark"
OS: Android
Kernel: 4.x.x
Uptime: Xh Xm
...


---

🤞 Aide

Tu peux consulter ou modifier à tout moment ta config avec :

edit

Tu veux tout réinitialiser ? Supprime ton fichier .zshrc puis relance le script :

rm ~/.zshrc
./install.sh


les raccourci:
update= pkg update && pkg upgrade
ll= ls
a= cd
back= Relancer Termux
edit= modifier le fichier de personalisation
cls= clear
a = cd


---

👤 Auteur

Rayfoul – alias le requin blanc
📧 Contact : japprendfacilementaprogrammer@gmail.com


---

📄 Licence

Ce script est libre d’utilisation et de modification pour tout usage personnel.


