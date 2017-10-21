
# TP1 PDS : Maccess
### KUNSANGABO NDONGALA Berfy et Patte Pierre
### L3S5 - Gr.4


> Le travail a porté sur la modélisation de la commande access. Cela a permis de découvrir notamment les appels syystèmes.

#### Bonne lecture !

---
## Table des matières

1. [Organisation du répertoire](#organisation)
2. [Installation](#install)
3. [Makefile](#makefile)


---
## <a name="organisation">1 Organisation du répertoire</a>

Ce répertoire est organisé comme ceci:

- `maccess.c` : fichier contenant le programme principale
- `Makefile` : pour automatiser les taches
- `README.md` : description du projet, informations et instructions


## <a name="install">2 Installation</a>

Si vous n'avez toujours pas clôné ce *repository*, exécutez la commande suivante

```
git clone https://gitlab-etu.fil.univ-lille1.fr/kunsangabondo/pds-fs.git
```

Sinon, récupérer la dernière version de ce *repository* par `git pull`.

Le code source de ce TP se trouve dans le sous-dossier `access`.

## <a name="makefile">3 Makefile</a>

Cette partie vous permet de compiler le code et effectuer bien d'autres tâches en vous évitant l'étape "manuelle".

### Prérequis

- Une machine *UNIX*
- Les outils *gcc*

### Utiliser la commande `make`

Voici les différentes commandes à exécuter:

- Compiler le projet : `make maccess`
- l'exécuter : `./maccess <fichier> <arg>`
- Nettoyer le répertoire : `make clean`
