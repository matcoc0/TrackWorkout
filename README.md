# TrackWorkout
Objectifs généraux : 
1) Authentification sécurisée
2) Ajout d'ami possible
3) Liste d'exercices dynamique et classifiée correctement
4) Enregistrement dynamique de séance
5) Tracking de progression

Roadmap : 
1) Intégration de l'entièreté de la BDD dans postgresql
-- Utilisation individuelle --
3) API endpoint : add, delete et modify : user, follow, exercice, session, session_exercice, exercise_sets, add request
4) Mise en place de l'authentification avec les tokens des users
5) mise en place de graphs, de tracking possible de sa progression
6) Interaction de suivi entre users : demande d'ami, comparaison, training streak (3 entrainements hebdos sur 12 semaines de suite), graphs de progression
7) Solidification du backend

POUR APRES :
l'objectif est de fournir au client une expérience lui permettant d'optimiser sa séance et sa progression avec une LLM puis un RAG intégrée :
exemple :
- messages d'encouragement au client au vu de sa progression
- Au développé couché, j'ai une vive douleur à l'arrière de l'épaule gauche, quels exercices pourraient y remédier ?
- j'ai un défaut triceps, comment remédier à ce déséquilibre ?
- Quel sport pourrait m'aider dans mon objectif physique perso ?

idéalement, il faudrait que le micro puisse être détecté, et que le chat écrit puisse être ouvert
L'objectif de ce site est de pouvoir englober l'entiereté d'un use case global lié à un client.

# Partie développement
Pour ce projet une VM Ubuntu a été créée dans WSL. Le développement de cette application a été fait grâce à l'extension WSL qui a permis à la fois de gérer l'ensemble des dépendences de la MV et de la venv à l'intérieur.
instructions montre ce qui a été fait comme étapes précisément.
un requirement .txt permet l'installation de l'ensemble des dépendances, du venv ainsi que de toutes les dépendances qui ont été faites.