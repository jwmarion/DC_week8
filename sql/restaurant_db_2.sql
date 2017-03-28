create table restaurant(
  id serial primary key,
  name varchar,
  address varchar,
  category varchar
);

create table reviewer(
  id serial primary key,
  name varchar,
  email varchar,
  karma integer,
  check (karma <= 7 and karma > 0)
);

create table review(
  id serial primary key,
  reviewer_id integer references reviewer(id),
  restaurant_id integer references restaurant(id),
  stars integer,
  check (stars <6 and stars > 0),
  title varchar,
  review varchar
);
