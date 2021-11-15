-- 1.¬ывести контакт у которого больше всего заблокированных пользователей и их колличество. 
select u.first_name,  u.last_name, 
	count(bu.id_to_users) as cnt -- "„исло заблокированных контактов"
	from users u 
	join blocked_users bu on bu.id_from_users = u.id
group by u.first_name, u.last_name
order by cnt desc -- "„исло заблокированных контактов"
limit 1
	;

-- 2. —колько в группе 1 мужчин и женщин?
select gender, count(*) 
	from groupe g
	join users_groupe ug on ug.id_groupe = g.id 
	join users u on u.id = ug.id_users 
where g.id = 1
group by u.gender 
;

-- 3. ” какого пользовател€ было больше всего сообшений?
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

-- 5. вывести контакты, которые встречаютс€ и в избранных и в заблокированных 