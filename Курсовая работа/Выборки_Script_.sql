-- 1.Вывести контакт у которого больше всего заблокированных пользователей и их колличество. 
select u.first_name,  u.last_name, 
	count(bu.id_to_users) as cnt -- "Число заблокированных контактов"
	from users u 
	join blocked_users bu on bu.id_from_users = u.id
group by u.first_name, u.last_name
order by cnt desc -- "Число заблокированных контактов"
limit 1
	;

-- 2. Сколько в группе 1 мужчин и женщин?
select gender, count(*) 
	from groupe g
	join users_groupe ug on ug.id_groupe = g.id 
	join users u on u.id = ug.id_users 
where g.id = 1
group by u.gender 
;

-- 3. У какого пользователя было больше всего сообшений?
with cte1 as (
select pc.from_user_id , count(*) as cnt
from personal_chat pc 
group by pc.from_user_id
union all
select gc.from_user_id, count(*) as cnt
from group_chat gc 
group by gc.from_user_id
)
select u.nick_name, sum(cnt) as sum_messages
from cte1 c1
join users u on u.id = c1.from_user_id
group by nick_name
order by sum_messages desc
limit 1
;


-- 4. сколько пользователей старше 10 лет?
SELECT *
, round(((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25),0) as age
from users
 where ((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) >10
;

-- 5. Найти 3 пользователей, которые проявляют наибольшую активность 
-- Считаем активность - это кол-во сообщений и медиа в групповых и личных чатах

with cte as 
(
select u.id, u.nick_name ,
	count(gc.id) as gc_cnt, 
	count(m.id) as media_cnt, 
	count(pc.id) as pc_cnt

from users u 
left join group_chat gc on u.id = gc.from_user_id 
left join personal_chat pc on u.id = pc.from_user_id 
left join media m on u.id = m.user_id 
group by u.id ,u.nick_name
)

select nick_name, gc_cnt + media_cnt + pc_cnt as cnt
from cte
order by cnt desc
limit 3;