#!/bin/bash

# Fichier contenant les domaines à bloquer
DOMAIN_FILE="/home/user/Téléchargements/blocked_domains.txt"

# Fonction pour ajouter des domaines
add_domains() {
  echo "Ajoutez les sites que vous voulez bloquer. Entrez 'fin' pour arrêter."
  
  while true; do
    read -p "Entrez un site à bloquer: " domain
    if [[ $domain == "fin" ]]; then
      break
    fi
    # Ajouter le domaine au fichier
    echo "$domain" >> "$DOMAIN_FILE"
    echo "Site ajouté : $domain"
  done

  echo "Tous les domaines ont été ajoutés à $DOMAIN_FILE"
}

# Vérifie si le fichier existe, sinon le créer
if [ ! -f "$DOMAIN_FILE" ]; then
  touch "$DOMAIN_FILE"
  echo "Le fichier $DOMAIN_FILE a été créé."
fi

# Exécuter la fonction
add_domains
