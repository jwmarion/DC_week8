select title, review
from review
where restaurant_id = 3

select title, review
from review
inner join restaurant on review.restaurant_id = restaurant.id
where restaurant.name = 'tacoTime'

select title, review
from review
inner join reviewer on review.reviewer_id = reviewer.id
where reviewer.name = 'Julie'

select restaurant.name, title, review
from reviewx
inner join restaurant on restaurant.id = review.restaurant_id

select restaurant.name, avg(review.stars)
from review
inner join restaurant on restaurant.id = review.restaurant_id
group by restaurant.name

select restaurant.name, count(review.id)
from review
inner join restaurant on restaurant.id = review.restaurant_id
group by restaurant.name

select restaurant.name, reviewer.name, review.title, review.review
from review
inner join restaurant on restaurant.id = review.restaurant_id
inner join reviewer on review.reviewer_id = reviewer.id

select reviewer.name, avg(review.stars)
from reviewer
inner join review on review.reviewer_id = reviewer.id
group by reviewer.name

select reviewer.name, min(review.stars)
from reviewer
inner join review on review.reviewer_id = reviewer.id
group by reviewer.name

select category, count(restaurant.category)
from restaurant
group by category

select restaurant.name, count(restaurant)
from restaurant
inner join review on review.restaurant_id = restaurant.id
where (review.stars = 5)
group by restaurant.name

select restaurant.category, avg(review.stars)
from restaurant
inner join review on review.restaurant_id = restaurant.id
group by restaurant.category
select *
from project
left outer join project_uses_tech
on project_uses_tech.project_id = project.id;

select *
from project
left outer join project_uses_tech
on project_uses_tech.project_id = project.id
left outer join tech
on tech.id = project_uses_tech.tech_id;

select distinct(tech.name)
from tech
right outer join project_uses_tech on project_uses_tech.tech_id = tech.id;

select distinct(tech.name)
from tech
where tech.id not in (select tech_id from project_uses_tech);

select distinct(project.name)
from project
where project.id not in (select project_id from project_uses_tech);

select *
from(select project.name, count(project_uses_tech.project_id)
	from project
	left join project_uses_tech on project.id = project_uses_tech.project_id
	group by  project.id) projectByCount
order by count;

select avg(count)
	from (select tech.name, count(project_uses_tech.tech_id)
	from project_uses_tech
	left join tech on project_uses_tech.tech_id = tech.id
	group by tech.id) techByCount
