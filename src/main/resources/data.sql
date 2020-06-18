--DROP TABLE CONTACT_DETAILS;
DROP TABLE IF EXISTS CONTACT_DETAILS;

CREATE TABLE CONTACT_DETAILS(
id INT AUTO_INCREMENT  PRIMARY KEY,
FIRST_NAME VARCHAR(30),
LAST_NAME VARCHAR(30),
EMAIL_ID VARCHAR(50),
CONTACT_NO VARCHAR(10),
STATUS VARCHAR(1)
);



--insert into contact_details(first_name,last_name,email_id,contact_no,status) values('Suman','Singh','suman.singh575@gmail.com','7350675433','A');
--insert into contact_details(first_name,last_name,email_id,contact_no,status) values('Priya','Raj','priyar120@gmail.com','6206836640','A');