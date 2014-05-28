CREATE TABLE recipes (
  id serial,
  name varchar(50) NOT NULL,
  time integer,
  directions text,
  created_at timestamp NOT NULL,
  completed_at timestamp
);

CREATE TABLE ingredients (
  id serial,
  quantity integer,
  food varchar(20) NOT NULL,
  recipe_id integer NOT NULL,
  yields varchar(25),
);





INSERT INTO tasks (description, estimated_duration, created_at)
  VALUES ('Learn SQL', 180, now());
