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
6) Interaction de suivi entre users 
7) Solidification du backend

POUR APRES :
l'objectif est de fournir au client une expérience lui permettant d'optimiser sa séance et sa progression avec une LLM intégrée :
exemple :
- Au développé couché, j'ai une vive douleur à l'arrière de l'épaule gauche, quels exercices pourraient y remédier ?
- j'ai un défaut triceps, comment remédier à ce déséquilibre ?
- Quel sport pourrait m'aider dans mon objectif physique perso ?

idéalement, il faudrait que le micro puisse être détecté, et que le chat écrit puisse être ouvert
L'objectif de ce site est de pouvoir englober l'entiereté d'un use case global lié à un client.
