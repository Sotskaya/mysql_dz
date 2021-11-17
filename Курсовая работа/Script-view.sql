-- Представление 1. Все контакты с указанием возраста.
drop view  if exists Age;
create view Age as
(SELECT id, first_name, last_name
, round(((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25),0) as age
from users);

select *
from age ;

-- Представление 2. Все личные и групповые чаты у которых есть медиа.
drop view  if exists All_chats;
create view All_chats as
(
select *
from group_chat
where media_id is not null 
union all 
select *
from personal_chat pc 
where media_id is not null 
);

select *
from All_chats ;