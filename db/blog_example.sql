DROP TABLE posts;

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  date_posted DATE
);
