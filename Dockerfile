# Utiliser l'image officielle de Node.js comme image de base
FROM node:18

# Créer et définir le répertoire de travail pour l'application
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installer les dépendances du backend
RUN npm install

# Copier tout le reste du code de l'application dans le conteneur
COPY . .

# Passer dans le répertoire frontend et installer les dépendances du frontend
WORKDIR /app/frontend
RUN npm install

# Construire l'application frontend
RUN npm run build

# Revenir au répertoire principal
WORKDIR /app

# Exposer le port sur lequel le backend sera disponible
EXPOSE 5000

# Démarrer l'application backend
CMD ["npm", "start"]
