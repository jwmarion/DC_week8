select name from restaraunt where stars = 5;
select name, best_dish from restaurant where stars = 5;
select id from restaurant where name = 'mcjames';
select name from restaurant where category = 'chinese';
select name from restaurant where does_takeout = '1';
select id from restaurant where category = 'texmex' and does_takeout = '1';
select name from restaurant where distance <= 2;
select name from restaurant where last_eaten not between current_date - interval '7 days' and  current_date;
select name from restaurant where stars = 5 and last_eaten not between current_date - interval '7 days' and  current_date;

select name, distance from restaurant order by distance;
select name, distance from restaurant order by distance limit 2;
select name from restaurant order by stars limit 2;
select name, stars from restaurant where distance < 2 order by stars limit 2;

select count(*) from restaurant;
select count(category), category from restaurant group by category;
select floor(avg(stars)), category from restaurant group by category;
select category, max(stars) from restaurant group by category;
