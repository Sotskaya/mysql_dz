CREATE DATABASE whatsapp;
use whatsapp;

-- 1.	Таблица пользователей (профиля)
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) COMMENT 'Имя пользователя',
 middle_name VARCHAR(255) COMMENT 'отчество пользователя',
  last_name VARCHAR(255) COMMENT 'фамилия пользователя',
  nick_name VARCHAR(255) COMMENT 'ник пользователя'
) COMMENT = 'пользователи';

-- 2.	Таблица статусов
DROP TABLE IF EXISTS users_Status;
CREATE TABLE users_Status (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 Status_text VARCHAR(255) ) COMMENT 'статус пользователя';

INSERT INTO whatsapp.users_Status (id,Status_text)
VALUES 
 (1, 'доступен'),
 (2, 'занят'),
 (3, 'на совещании'),
 (4, 'сплю'),
 (5,'на занятии');

ALTER TABLE users ADD status_id INT UNSIGNED NOT NULL COMMENT 'идентификатор статуса';
ALTER TABLE users ADD CONSTRAINT users_Status_user_id FOREIGN KEY (status_id) REFERENCES users_Status (id); 
select * from users u join users_status us on u.status_id = us.id ;


-- 3.	Таблица избранных пользователей 
DROP TABLE IF EXISTS favourites_users;
CREATE TABLE favourites_users (
id_from_users INT UNSIGNED NOT NULL, 
id_to_users INT UNSIGNED NOT NULL 
) COMMENT = 'избранные пользователи';

ALTER TABLE favourites_users ADD CONSTRAINT favourites_users_user_id FOREIGN KEY (id_from_users) REFERENCES users(id); 
ALTER TABLE favourites_users ADD CONSTRAINT favourites_to_users_user_id FOREIGN KEY (id_to_users) REFERENCES users(id); 

-- 4.	Таблица заблокированных контактов 
DROP TABLE IF EXISTS blocked_users;
CREATE TABLE blocked_users (
id_from_users INT UNSIGNED NOT NULL, 
id_to_users INT UNSIGNED NOT NULL 
) COMMENT = 'заблокированные пользователи';

ALTER TABLE blocked_users ADD CONSTRAINT blocked_users_user_id FOREIGN KEY (id_from_users) REFERENCES users(id); 
ALTER TABLE blocked_users ADD CONSTRAINT blocked_to_users_user_id FOREIGN KEY (id_to_users) REFERENCES users(id); 

-- 5.	таблица со списком личных чатов (сообщений)
DROP TABLE IF EXISTS personal_chat;
  CREATE TABLE personal_chat (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
  from_user_id int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  to_user_id int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  body text NOT NULL COMMENT 'Текст сообщения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки'
 ) COMMENT = 'таблица со списком личных чатов (сообщений)';
 
ALTER TABLE personal_chat ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id); 
ALTER TABLE personal_chat add CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users (id);

-- 6.	таблица групп
DROP TABLE IF EXISTS groupe;
  CREATE TABLE groupe (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
  name VARCHAR(255) COMMENT 'Имя группы'
  ) COMMENT = 'таблица групп';
  
  -- 7. таблица участников групп
 DROP TABLE IF EXISTS users_groupe;
  CREATE TABLE users_groupe (
 id_users INT UNSIGNED, 
 id_groupe INT UNSIGNED
  ) COMMENT = 'таблица участников групп';
 
ALTER TABLE users_groupe ADD CONSTRAINT users_groupe_user_id FOREIGN KEY (id_users) REFERENCES users(id); 
ALTER TABLE users_groupe ADD CONSTRAINT users_groupe_groupe_id FOREIGN KEY (id_groupe) REFERENCES groupe(id); 
  
-- 8. таблица груповых сообщений
  DROP TABLE IF EXISTS group_chat;
  CREATE TABLE group_chat (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
  from_user_id int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  to_user_id int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  body text NOT NULL COMMENT 'Текст сообщения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки'
 ) COMMENT = 'список групповых чатов';
 
ALTER TABLE personal_chat ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id); 
ALTER TABLE personal_chat add CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users (id);




