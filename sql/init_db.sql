CREATE USER springuser;
CREATE DATABASE db_example;

-- remember to change your user and password to something more secure!
GRANT ALL PRIVILEGES ON db_example.* TO 'springuser'@'%' IDENTIFIED BY 'ThePassword';
