-- =====================================
-- SEED USERS
-- =====================================
INSERT INTO users (username, email, password_hash, name, surname, role)
VALUES 
('user1', 'user1@example.com', 'hashed_pw1', 'User', 'One', 'user'),
('user2', 'user2@example.com', 'hashed_pw2', 'User', 'Two', 'user'),
('user3', 'user3@example.com', 'User3hashed', 'User', 'Three', 'user'),
('coach1', 'coach1@example.com', 'hashed_pw4', 'Coach', 'One', 'coach');

-- =====================================
-- SEED FOLLOWS (amis / abonnements)
-- =====================================
INSERT INTO follows (follower_id, followed_id)
VALUES
(1, 2),
(2, 1),
(3, 1),
(1, 4),
(2, 4);

-- =====================================
-- SEED MUSCLE GROUPS
-- =====================================
INSERT INTO muscle_groups (name)
VALUES ('Chest'), ('Back'), ('Legs'), ('Arms'), ('Core');

-- =====================================
-- SEED EXERCISE TYPES
-- =====================================
INSERT INTO exercise_types (name, description, muscle_group_id, category)
VALUES
('Bench Press', 'Barbell bench press', 1, 'push'),
('Pull Up', 'Bodyweight pull up', 2, 'pull'),
('Squat', 'Barbell squat', 3, 'leg'),
('Bicep Curl', 'Dumbbell curl', 4, 'pull'),
('Plank', 'Static core hold', 5, 'core');

-- =====================================
-- SEED EXERCISES
-- =====================================
INSERT INTO exercises (name, description, type_id)
VALUES
('Flat Bench Press', 'Bench press flat barbell', 1),
('Wide Grip Pull Up', 'Pull up with wide grip', 2),
('Back Squat', 'Squat with barbell on back', 3),
('Dumbbell Bicep Curl', 'Curl with dumbbells', 4),
('Front Plank', 'Hold plank position', 5);

-- =====================================
-- SEED SESSIONS
-- =====================================
INSERT INTO sessions (user_id, coach_id, session_date, start_time, duration_minutes, status)
VALUES
(1, 4, '2025-09-15', '09:00', 60, 'planned'),
(2, 4, '2025-09-15', '10:00', 45, 'planned'),
(3, 4, '2025-09-15', '11:00', 30, 'planned');

-- =====================================
-- SEED SESSION_EXERCISES
-- =====================================
INSERT INTO session_exercises (session_id, exercise_id, notes)
VALUES
(1, 1, 'Warm up included'),
(1, 5, 'Focus on core stability'),
(2, 2, '3 sets of max reps'),
(3, 3, 'Light weight for form');

-- =====================================
-- SEED EXERCISE_SETS
-- =====================================
INSERT INTO exercise_sets (session_exercise_id, set_number, reps, weight_kg, rpe, load_kg)
VALUES
(1, 1, 10, 50, 7, 50),
(1, 2, 8, 55, 8, 55),
(2, 1, 60, 0, 6, 0),
(3, 1, 12, 40, 7, 40),
(4, 1, 15, 20, 5, 20);

-- =====================================
-- SEED PLANNED_SESSIONS
-- =====================================
INSERT INTO planned_sessions (user_id, scheduled_date, scheduled_time, coach_id, objective)
VALUES
(1, '2025-09-16', '09:00', 4, 'Strength training'),
(2, '2025-09-16', '10:00', 4, 'Back and pull-ups focus');

-- =====================================
-- SEED SESSION_TEMPLATES
-- =====================================
INSERT INTO session_templates (name, coach_id, description)
VALUES
('Full Body Beginner', 4, 'Template for beginners'),
('Pull & Push Advanced', 4, 'Template for advanced push/pull');

-- =====================================
-- SEED TEMPLATE_EXERCISES
-- =====================================
INSERT INTO template_exercises (template_id, exercise_id, recommended_sets, recommended_reps, recommended_weight)
VALUES
(1, 1, 3, 10, 50),
(1, 3, 3, 12, 40),
(1, 5, 2, 60, 0),
(2, 1, 4, 8, 70),
(2, 2, 4, 10, 0),
(2, 4, 3, 12, 20);