CREATE DATABASE "E_Learning";

CREATE TABLE IF NOT exists "User" (
    "id" serial primary key,
    "username" VARCHAR,
    "password" VARCHAR,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Admin" (
    "id" serial primary key,
    "user_id" INT NOT NULL REFERENCES "User"("id"),
    "name" VARCHAR,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Mentor" (
    "id" serial primary key,
    "user_id" INT NOT NULL REFERENCES "User"("id"),
    "name" VARCHAR,
    "experience" VARCHAR,
    "degeree" VARCHAR,
    "phone_number" VARCHAR,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Student" (
    "id" serial primary key,
    "user_id" INT NOT NULL REFERENCES "User"("id"),
    "name" VARCHAR,
    "entry_year" INT,
    "phone_number" VARCHAR,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Class" (
    "id" serial primary key,
    "classroom" VARCHAR,
    "capacity" INT,
    "admin_id" INT NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Schedule" (
    "id" serial primary key,
    "class_id" INT NOT NULL REFERENCES "Class"("id"),
    "start_time" DATE NOT NULL,
    "end_time" DATE NOT NULL,
    "admin_id" INT NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Course" (
    "id" serial primary key,
    "mentor_id" INT NOT NULL REFERENCES "Mentor"("id"),
    "title" VARCHAR NOT NULL,
    "admin_id" INT NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Assignment" (
    "id" serial primary key,
    "course_id" INT NOT NULL REFERENCES "Course"("id"),
    "title" VARCHAR NOT NULL,
    "admin_id" INT NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "StudentCourse" (
    "id" serial primary key,
    "student_id" INT NOT NULL REFERENCES "Student"("id"),
    "course_id" INT NOT NULL REFERENCES "Course"("id"),
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "StudentAssignment" (
    "id" serial primary key,
    "student_id" INT NOT NULL REFERENCES "Student"("id"),
    "assignment_id" INT NOT NULL REFERENCES "Assignment"("id"),
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Pressence" (
    "id" serial primary key,
    "student_id" INT NOT NULL REFERENCES "Student"("id"),
    "schedule_id" INT NOT NULL REFERENCES "Schedule"("id"),
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Grade" (
    "id" serial primary key,
    "student_coure_id" INT NOT NULL REFERENCES "StudentCourse"("id"),
    "grade" VARCHAR NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Announcement" (
    "id" serial primary key,
    "title" VARCHAR NOT NULL,
    "content" VARCHAR NOT NULL,
    "admin_id" INT NOT NULL,
    "createdAt" DATE NOT NULL
);
CREATE TABLE IF NOT exists "Leaderboard" (
    "id" serial primary key,
    "title" VARCHAR NOT NULL,
    "content" VARCHAR NOT NULL,
    "createdAt" DATE NOT NULL
);
