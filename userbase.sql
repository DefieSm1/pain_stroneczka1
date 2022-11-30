DROP DATABASE IF EXISTS userbase;
CREATE DATABASE userbase;

USE userbase;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    userpass VARCHAR(255) NOT NULL,
    firstname VARCHAR(40) DEFAULT '',
    lastname VARCHAR(40) DEFAULT '',
    user_role VARCHAR(20) NOT NULL DEFAULT 'user',
    register_date DATE NOT NULL DEFAULT(CURRENT_DATE)
);

CREATE TABLE classes (
    id INT AUTO_INCREMENT, 
    class_name VARCHAR(5),
    PRIMARY KEY (id)
);

CREATE TABLE students (
    id INT AUTO_INCREMENT, 
    firstname VARCHAR(20), 
    surname VARCHAR(20),
    class_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

CREATE TABLE school_subjects (
    id INT AUTO_INCREMENT,
    subject_name VARCHAR(20),
    class_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

CREATE TABLE teachers (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(20),
    surname VARCHAR(20),
    age INT,
    school_subject_id INT UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (school_subject_id) REFERENCES school_subjects(id)
);

INSERT INTO classes (class_name) VALUES ("3b");

INSERT INTO students (firstname, surname, class_id) VALUES ("Darek", "Dariusz", 1);
INSERT INTO students (firstname, surname, class_id) VALUES ("Krzysiek", "Krzystusz", 1);

INSERT INTO school_subjects (subject_name, class_id) VALUES ("PIPUSMECH", 1);
INSERT INTO school_subjects (subject_name, class_id) VALUES ("EDB", 1);

INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Marek", "Mariusz", 35, 1);
INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Kazik", "Kaziusz", 40, 2);

INSERT INTO classes (class_name) VALUES ("3a");

INSERT INTO students (firstname, surname, class_id) VALUES ("Jacek", "Jariusz", 2);
INSERT INTO students (firstname, surname, class_id) VALUES ("Wlodek", "Wlodiusz", 2);

INSERT INTO school_subjects (subject_name, class_id) VALUES ("SIAI", 2);
INSERT INTO school_subjects (subject_name, class_id) VALUES ("POF", 2);

INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Maciek", "Maciusz", 30, 3);
INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Pawelek", "Pawelusz", 25, 4);

INSERT INTO classes (class_name) VALUES ("3c");

INSERT INTO students (firstname, surname, class_id) VALUES ("Szymek", "Szymusz", 3);
INSERT INTO students (firstname, surname, class_id) VALUES ("Matek", "Mateusz", 3);

INSERT INTO school_subjects (subject_name, class_id) VALUES ("SOSK", 3);
INSERT INTO school_subjects (subject_name, class_id) VALUES ("JR", 3);

INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Slawek", "Slawiusz", 40, 5);
INSERT INTO teachers (firstname, surname, age, school_subject_id) VALUES ("Szczurek", "Szczuriusz", 45, 6);

SELECT firstname, surname, class_name FROM students, classes WHERE (students.class_id = classes.id);

SELECT firstname, surname, subject_name, class_name FROM teachers, school_subjects, classes WHERE (teachers.school_subject_id = school_subjects.id) AND (school_subjects.class_id = classes.id);