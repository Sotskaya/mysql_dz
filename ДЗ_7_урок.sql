-- ������� 1. ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

select *
	from users;

select *
	from orders;

INSERT INTO orders values
	(DEFAULT, 1, DEFAULT, DEFAULT),
	(DEFAULT, 1, DEFAULT, DEFAULT),
	(DEFAULT, 2, DEFAULT, DEFAULT);

INSERT INTO users VALUES
	(DEFAULT, 'maria', '1982-10-11', NOW(), NOW()),
	(DEFAULT, 'valentina', '1990-01-01', NOW(), NOW()),
	(DEFAULT, 'petr', '1974-01-01', NOW(), NOW());

SELECT u.name
	FROM users AS u
	INNER JOIN orders AS o ON (o.user_id = u.id)
	GROUP BY u.name
	HAVING COUNT(o.id) > 0;

-- ������� 2. �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

select *
	from products p ;
	
select *
	from catalogs c ;
	
INSERT INTO products VALUES
  (DEFAULT, 'Intel 8080', '', 800, 1, DEFAULT, DEFAULT),
  (DEFAULT, 'Intel 8086', '', 900, 1, DEFAULT, DEFAULT),
  (DEFAULT, 'MSI 123', '', 340, 2, DEFAULT, DEFAULT);
  
 select p.name "������", c.name "�������"
 from products p 
 inner join catalogs c on (c.id = p.catalog_id)
 GROUP BY p.id ;
 

