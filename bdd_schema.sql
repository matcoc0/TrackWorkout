-- UTILISATEURS
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE,
    email VARCHAR,
    password_hash VARCHAR,
    name VARCHAR,
    surname VARCHAR,
    subscription_type VARCHAR,
    subscription_expiration DATE,
    role VARCHAR,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ABONNEMENTS / AMIS
CREATE TABLE follows (
    id SERIAL PRIMARY KEY,
    follower_id INTEGER NOT NULL REFERENCES users(id),
    followed_id INTEGER NOT NULL REFERENCES users(id),
    created_at TIMESTAMP DEFAULT NOW()
);

-- GROUPES MUSCULAIRES
CREATE TABLE muscle_groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

-- TYPES D’EXERCICES
CREATE TABLE exercise_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    muscle_group_id INTEGER REFERENCES muscle_groups(id),
    category VARCHAR(20) -- push / pull / leg / core
);

-- EXERCICES
CREATE TABLE exercises (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    type_id INTEGER REFERENCES exercise_types(id)
);

-- SÉANCES
CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    coach_id INTEGER REFERENCES users(id),
    session_date DATE,
    start_time TIME,
    duration_minutes INTEGER,
    notes TEXT,
    status VARCHAR(20) DEFAULT 'ongoing', -- ongoing / completed / planned
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- EXERCICES DANS UNE SÉANCE
CREATE TABLE session_exercises (
    id SERIAL PRIMARY KEY,
    session_id INTEGER NOT NULL REFERENCES sessions(id),
    exercise_id INTEGER NOT NULL REFERENCES exercises(id),
    notes TEXT,
    updated_at TIMESTAMP DEFAULT NOW()
);

-- SÉRIES (SETS)
CREATE TABLE exercise_sets (
    id SERIAL PRIMARY KEY,
    session_exercise_id INTEGER NOT NULL REFERENCES session_exercises(id),
    set_number INTEGER NOT NULL,
    reps INTEGER NOT NULL,
    weight_kg FLOAT,              -- poids appliqué
    execution_time_seconds INTEGER,
    rest_before_seconds INTEGER,
    rpe INTEGER,
    load_kg FLOAT DEFAULT 0,      -- charge réelle : positif = poids appliqué, négatif = délesté
    notes TEXT,
    updated_at TIMESTAMP DEFAULT NOW()
);

-- SÉANCES PLANIFIÉES
CREATE TABLE planned_sessions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    scheduled_date DATE,
    scheduled_time TIME,
    coach_id INTEGER REFERENCES users(id),
    objective TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- TEMPLATES DE SÉANCE
CREATE TABLE session_templates (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    coach_id INTEGER REFERENCES users(id),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);



-- VUE POUR PERFORMANCES ET GRAPHIQUES
CREATE VIEW performance_view AS
SELECT
    u.id AS user_id,
    u.username,
    mg.name AS muscle_group,
    et.category AS type_category,
    e.name AS exercise_name,
    se.session_id,
    es.set_number,
    es.reps,
    es.weight_kg,
    es.load_kg,
    es.rpe,
    s.session_date
FROM exercise_sets es
JOIN session_exercises se ON es.session_exercise_id = se.id
JOIN exercises e ON se.exercise_id = e.id
JOIN exercise_types et ON e.type_id = et.id
JOIN muscle_groups mg ON et.muscle_group_id = mg.id
JOIN sessions s ON se.session_id = s.id
JOIN users u ON s.user_id = u.id;
