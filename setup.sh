#!/bin/bash

# =======================================
# setup.sh - Crée l'architecture backend
# =======================================

set -e

echo "🚀 Démarrage du setup du projet backend..."

# 1️⃣ Supprimer le dossier app s'il existe
if [ -d "app" ]; then
    echo "🗑 Suppression du dossier app existant..."
    rm -rf app
fi

# 2️⃣ Créer les dossiers principaux
mkdir -p app/{api,crud,models,schemas,utils,services,tests}
mkdir -p docker

echo "📁 Dossiers principaux créés."

# 3️⃣ Créer les fichiers Python principaux
touch app/main.py
touch app/config.py
touch app/dependencies.py
touch app/__init__.py
touch app/api/__init__.py
touch app/crud/__init__.py
touch app/models/__init__.py
touch app/schemas/__init__.py
touch app/utils/__init__.py
touch app/services/__init__.py
touch app/tests/__init__.py

echo "🐍 Fichiers Python créés."

# 4️⃣ Créer requirements.txt avec les packages de base
cat <<EOL > requirements.txt
fastapi
uvicorn[standard]
sqlalchemy
pydantic
psycopg2-binary
alembic
python-dotenv
EOL

echo "📦 requirements.txt créé."

# 5️⃣ Créer un Dockerfile
cat <<EOL > Dockerfile
# Dockerfile pour backend FastAPI
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \\
    && pip install -r requirements.txt

COPY ./app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
EOL

echo "🐳 Dockerfile créé."

# 6️⃣ Créer docker-compose.yml
cat <<EOL > docker-compose.yml
version: '3.9'

services:
  backend:
    build: .
    container_name: backend
    volumes:
      - ./app:/app
    ports:
      - "8000:8000"
    depends_on:
      - db

  db:
    image: postgres:15
    container_name: db
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: fitness_db
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
EOL

echo "📦 docker-compose.yml créé."

# 7️⃣ Créer un main.py de base
cat <<EOL > app/main.py
from fastapi import FastAPI

app = FastAPI(title="Fitness Tracker API")

@app.get("/")
def read_root():
    return {"message": "Bienvenue sur l'API Fitness Tracker!"}
EOL

echo "🚀 Architecture initiale créée avec succès !"
echo "💡 Vous pouvez maintenant lancer votre backend avec :"
echo "   docker-compose up --build"
