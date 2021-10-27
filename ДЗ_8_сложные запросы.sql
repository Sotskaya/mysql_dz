/* 1. Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).*/

/*посчитать количесво сообщений у всех пользователей (сделать джjйн всех пользователей), если сообщения были (больще 0), 
вывести 1 пользователя по мере возрастания (т е у кого больше сообщений)*/

SELECT U.first_name, count(*) as bstfriend 
FROM users
JOIN 
ORDER BY rate DESC
LIMIT 1;

use vk;

SELECT U.first_name, u.last_name, count(*) as rate 
	FROM 
	(
	SELECT to_user_id AS best_friend_id 
	FROM messages 
	WHERE 
	from_user_id = ${user} -- Выбираем ID заданного пользователя
	union ALL
	SELECT from_user_id  
	FROM messages 
	WHERE to_user_id = ${user}
	) cte
	INNER JOIN users U 
		ON U.id = CTE.best_friend_id
GROUP BY best_friend_id
ORDER BY rate DESC
LIMIT 1;



/* 2.Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..*/
with cte as 
	(select id, first_name, last_name
	from users u 
where age < 10)
,cte2 as(
	select user_id, count(*) as cnt
from vk.likes_media
where user_id in 
(select id
from cte)
group by user_id
union all 
select user_id, count(*) as cnt
from vk.likes_post lp 
where user_id in 
(select id
from cte)
group by user_id
)
select sum(cnt) from cte2
;

/* 3. Определить кто больше поставил лайков (всего): мужчины или женщины.*/

with cte as 
(	
select user_id 
from vk.likes_media

union all 
select user_id 
from vk.likes_post lp 

union all 
select user_id
from vk.likes_users lu 

)
select gender, count(*) as cnt
from cte
join users u on u.id = cte.user_id
group by gender
order by cnt desc 
limit 1;