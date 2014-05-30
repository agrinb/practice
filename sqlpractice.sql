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





INSERT INTO recipes (name, time, directions)
  VALUES ('Green Eggs & Ham', 25, '1. Cook the eggs.
2. Cook the ham.
3. Combine.
';

INSERT INTO recipes (name, time, directions)
  VALUES ('Fried Green Tomatoes', '', '1. Slice the tomatoes 1/2 inch thick.
2. Whisk eggs and milk together.
3. Dip tomatoes in egg mixture and then bread crumbs.
4. Heat oil in a large skillet.
5. Fry the tomatoes in the oil.
';


INSERT INTO recipes (name, time, directions)
  VALUES ('Martini', '','1. Pour all ingredients into mixing glass with ice cubes.
2. Stir well.
3. Strain in chilled martini cocktail glass.
4. Squeeze oil from lemon peel onto the drink, or garnish with olive.';

INSERT INTO ingredients (quantity, food, yields, recipe_id)
  VALUES
(4,'Green Eggs & Ham', 2, 1)
(.5, Ham)
(3 large green tomatoes
2 eggs
1/2 cup milk
1/2 cup breadcrumbs
1 quart vegetable oil




Ingredients:
4 green eggs
1/2 lb ham





