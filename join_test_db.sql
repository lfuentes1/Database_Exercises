CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null),
('letty', 'letty@example.com', 2),
('pascal', 'pascal@example.com', 2),
('mk', 'mk@example.com', 2),
('craig', 'craig@example', null);

SELECT * FROM users AS u
LEFT JOIN roles AS r ON u.role_id = r.id;

SELECT * FROM users AS u
RIGHT JOIN roles AS r ON u.role_id = r.id;

SELECT * FROM users AS u
JOIN roles AS r ON u.role_id = r.id;

SELECT r.name AS 'roles', COUNT(u.role_id) AS 'role count' FROM users AS u
RIGHT JOIN roles AS r ON u.role_id = r.id
GROUP BY u.role_id;

-- Option #2
-- SELECT users.name AS 'User Name', roles.name AS 'Role', COUNT(role_id)
-- FROM users
-- RIGHT JOIN roles ON users.role_id = roles.id
-- GROUP BY role;

-- Option #3
-- SELECT r.name as "Role", COUNT(u.id) AS "Numbers of Users with Role"
-- FROM ries as 
-- LEFT JOIN users as u ON r.id = u.role_id
-- GROUP BY r.name;


