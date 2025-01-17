# Faketok API

Faketok API est une API développée avec NestJS pour accompagner l'application React [ **Faketok**](https://github.com/lucas-laza/faketok-front) . Cette API sert à simuler un système de recommandation piégeant les utilisateurs dans des bulles de contenu.

## Prérequis

- Node.js
- npm
- MySQL

## Installation

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/faketok-api.git
   ```

2. Accédez au répertoire du projet :
   ```bash
   cd faketok-api
   ```

3. Installez les dépendances :
   ```bash
   npm install
   ```

## Configuration de la base de données

1. Créez une base de données locale nommée `tiktok` :
   ```sql
   CREATE DATABASE tiktok;
   ```

2. Importez le fichier `tiktok.sql` situé à la racine du projet :
   ```bash
   mysql -u [votre_utilisateur] -p tiktok < tiktok.sql
   ```

3. Configurez les informations de connexion à la base de données dans le fichier `.env` :
   ```env
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=[votre_utilisateur]
   DB_PASSWORD=[votre_mot_de_passe]
   DB_NAME=tiktok
   ```

## Lancer l'API

1. Démarrez le serveur :
   ```bash
   npm run start:dev
   ```

2. Accédez à l'API sur :
   ```
   http://localhost:3001
   ```

## Scripts disponibles

- **`npm run start`** : Démarre l'API en mode production.
- **`npm run start:dev`** : Démarre l'API en mode développement.
- **`npm run test`** : Lance les tests unitaires.
- **`npm run build`** : Compile le projet.


