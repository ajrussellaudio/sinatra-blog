DROP TABLE comments;
DROP TABLE posts;

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  posted_on DATE
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body TEXT,
  posted_on DATE,
  post_id INT REFERENCES posts(id)
);
