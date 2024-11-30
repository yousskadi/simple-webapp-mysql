# Utiliser une image Python Alpine
FROM python:alpine

# Copier les dépendances Python
ADD ./requirements.txt /opt/webapp-mysql/

# Définir le répertoire de travail
WORKDIR /opt/webapp-mysql

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier les fichiers de l'application
ADD . /opt/webapp-mysql


# Définir une variable d'environnement pour désactiver SSL
ENV DB_SSL_DISABLED=true

# Exposer le port pour Flask
EXPOSE 8080

# Lancer l'application
CMD python /opt/webapp-mysql/app.py
