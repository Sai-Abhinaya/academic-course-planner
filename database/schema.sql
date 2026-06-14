CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department VARCHAR(50),
    semester INT
);

CREATE TABLE prerequisites (
    id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(id),
    prerequisite_course_id INT REFERENCES courses(id)
);

CREATE TABLE semester_plans (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES users(id),
    semester_no INT NOT NULL
);

CREATE TABLE planned_courses (
    id SERIAL PRIMARY KEY,
    plan_id INT REFERENCES semester_plans(id),
    course_id INT REFERENCES courses(id)
);