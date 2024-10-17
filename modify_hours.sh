#!/bin/bash

# Chemin vers le fichier proxado_iptables
PROXADO_FILE="/home/user/Téléchargements/proxado_iptables"

# Demander à l'utilisateur l'heure de début et de fin du blocage
read -p "Entrez l'heure de début de blocage (format HHMM, ex: 2030 pour 20h30): " START_TIME
read -p "Entrez l'heure de fin de blocage (format HHMM, ex: 0930 pour 9h30): " END_TIME

# Vérifier que les heures sont au bon format
if [[ ! $START_TIME =~ ^[0-9]{4}$ ]] || [[ ! $END_TIME =~ ^[0-9]{4}$ ]]; then
    echo "Erreur : Les heures doivent être au format HHMM (ex: 2030, 0930)."
    exit 1
fi

# Modifier les heures dans le fichier proxado_iptables
sed -i "s/if \[\[ \$CURRENT_TIME -ge [0-9]\{4\} \]\] || \[\[ \$CURRENT_TIME -lt [0-9]\{4\} \]\]; then/if \[\[ \$CURRENT_TIME -ge $START_TIME \]\] || \[\[ \$CURRENT_TIME -lt $END_TIME \]\]; then/" "$PROXADO_FILE"

# Message de confirmation
echo "Les heures de blocage ont été mises à jour : de $START_TIME à $END_TIME."
