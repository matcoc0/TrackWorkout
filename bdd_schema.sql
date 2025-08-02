-- utilisateurs
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
  created_at TIMESTAMP
);

-- abonnements / amis
CREATE TABLE follows (
  id SERIAL PRIMARY KEY,
  follower_id INTEGER NOT NULL REFERENCES users(id),
  followed_id INTEGER NOT NULL REFERENCES users(id),
  created_at TIMESTAMP
);

-- groupes musculaires
CREATE TABLE muscle_groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE
);

-- types d'exercices
CREATE TABLE exercise_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  muscle_group_id INTEGER REFERENCES muscle_groups(id)
);

-- exercices
CREATE TABLE exercises (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  type_id INTEGER REFERENCES exercise_types(id)
);

-- séances réalisées
CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  coach_id INTEGER REFERENCES users(id),
  session_date DATE,
  start_time TIME,
  duration_minutes INTEGER,
  notes TEXT,
  created_at TIMESTAMP
);

-- exercices dans une séance
CREATE TABLE session_exercises (
  id SERIAL PRIMARY KEY,
  session_id INTEGER NOT NULL REFERENCES sessions(id),
  exercise_id INTEGER NOT NULL REFERENCES exercises(id),
  notes TEXT
);

-- séries (sets)
CREATE TABLE exercise_sets (
  id SERIAL PRIMARY KEY,
  session_exercise_id INTEGER NOT NULL REFERENCES session_exercises(id),
  set_number INTEGER NOT NULL,
  reps INTEGER NOT NULL,
  weight_kg FLOAT,
  execution_time_seconds INTEGER,
  rest_before_seconds INTEGER,
  rpe INTEGER,
  notes TEXT
);

-- séances planifiées
CREATE TABLE planned_sessions (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  scheduled_date DATE,
  scheduled_time TIME,
  coach_id INTEGER REFERENCES users(id),
  objective TEXT,
  created_at TIMESTAMP
);
