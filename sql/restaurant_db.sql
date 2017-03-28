create table restaurant(
  id serial primary key,
  name varchar,
  distance integer,
  stars integer,
  category varchar,
  best_dish varchar,
  does_takeout boolean default false,
  last_eaten date
);
