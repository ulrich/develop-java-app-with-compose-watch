CREATE TABLE students
(
    id   SERIAL PRIMARY KEY,
    name TEXT    NOT NULL,
    age  INTEGER NOT NULL
);

INSERT INTO students (name, age)
VALUES ('Ulrich', 49),
       ('Mélinda', 45),
       ('Chloé', 17),
       ('Nicolas', 15);
