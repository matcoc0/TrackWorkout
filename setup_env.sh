#!/bin/bash
set -e

# nom du dossier projet attendu
PROJET_DIR="TrackWorkout"

# vérifier que l'on est dans le bon dossier
CURRENT_DIR_NAME=$(basename "$PWD")
if [ "$CURRENT_DIR_NAME" != "$PROJET_DIR" ]; then
    echo "Erreur : pas dans le dossier source du projet ($PROJET_DIR)"
    exit 1
fi

# installer Python venv si nécessaire
sudo apt update
sudo apt install -y python3 python3-pip python3-venv

# installer PostgreSQL si nécessaire
sudo apt install -y postgresql postgresql-contrib
sudo service postgresql start

# installer Docker via paquet Ubuntu (docker.io)
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# packages Python à installer
PACKAGES="psycopg2-binary pandas numpy"

# supprimer l'ancien venv s'il existe
if [ -d "venv" ]; then
    rm -rf venv
    echo "Ancien environnement virtuel supprimé"
fi

# créer le nouvel environnement virtuel
python3 -m venv venv
echo "Environnement virtuel créé"

# activer l'environnement virtuel
source venv/bin/activate
echo "Environnement virtuel activé"

# mettre à jour pip
pip install --upgrade pip

# installer les packages Python
pip install $PACKAGES
echo "Packages installés : $PACKAGES"

# générer le requirements.txt
pip freeze > requirements.txt
echo "Fichier requirements.txt généré"

# désactiver l'environnement
deactivate
echo "Environnement virtuel désactivé"

echo "Installation complète terminée. Fermez et rouvrez le terminal pour Docker si nécessaire."
