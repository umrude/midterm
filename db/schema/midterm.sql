
-- MIDTERM ERD

-- DROP TABLE IF EXISTS users CASCADE;
-- DROP TABLE IF EXISTS maps CASCADE;
-- DROP TABLE IF EXISTS markers CASCADE;
-- DROP TABLE IF EXISTS contributions CASCADE;
-- DROP TABLE IF EXISTS favorites CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE maps (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  marker_id INTEGER REFERENCES maps(id) ON DELETE CASCADE,
  title VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE markers (
  id SERIAL PRIMARY KEY NOT NULL,
  map_id INTEGER REFERENCES maps(id),
  data jsonb -- (name, address, lat, long)
);

CREATE TABLE contributions (
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE
);

CREATE TABLE favorites (
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE
);
