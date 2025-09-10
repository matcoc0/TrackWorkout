#!/bin/bash

# On suppose que tu es déjà dans le dossier TrackWorkout
# Crée la structure FastAPI
mkdir -p app/models
mkdir -p app/schemas
mkdir -p app/crud
mkdir -p app/api
mkdir -p app/utils

# Crée les fichiers principaux
touch app/main.py
touch app/config.py
touch app/dependencies.py
touch app/models/__init__.py
touch app/schemas/__init__.py
touch app/crud/__init__.py
touch app/api/__init__.py
touch app/utils/__init__.py

# Fichier requirements
cat <<EOL > requirements.txt
fastapi
uvicorn[standard]
sqlalchemy
psycopg2-binary
alembic
pydantic
python-dotenv
EOL

# Dockerfile
cat <<EOL > Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
EOL

# docker-compose.yml
cat <<EOL > docker-compose.yml
version: '3.8'

services:
  db:
    image: postgres:15
    restart: always
    environment:
      POSTGRES_USER: track_user
      POSTGRES_PASSWORD: track_pass
      POSTGRES_DB: trackworkout
    ports:
      - "5432:5432"
    volumes:
      - db_data:/var/lib/postgresql/data

  backend:
    build: .
    restart: always
    ports:
      - "8000:8000"
    environment:
      DATABASE_URL: postgresql://track_user:track_pass@db:5432/trackworkout
    depends_on:
      - db

volumes:
  db_data:
EOL

# Fichier FastAPI minimal
cat <<EOL > app/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "TrackWorkout backend is running!"}
EOL

echo "✅ Structure TrackWorkout créée avec succès !"
echo "Tu peux maintenant lancer : docker-compose up --build"
