create table olx2.users(
	user_id INT ,
    f_name varchar(220),
    l_name varchar(225),
    user_email varchar(225),
    user_password varchar(220),
    user_location varchar(220),
    mobile_no varchar(30)
);


insert into olx2.users values (1, 'Azeem','Shoukat', 'azeemshoukat000@gmail.com', '###azeem000#', 'Lahore', '0303-8454507'),
						(2, 'Yahya','Aman', 'yahyaamaan000@gmail.com', '###amaan0320#', 'Lahore', '0333-3454557'),
                        (3, 'Rohaan','Farooq', 'farooqrohaan000@gmail.com', '##rohaan095#', 'Islamabad', '0324-0987890'),
                        (4, 'Ahsan','Aijaz', 'aijazahmad000@gmail.com', '##ahmadaijaz000#', 'Faisalabad', '0314-8897607'),
                        (5, 'Faizan','Shabbir', 'faizan000@gmail.com', '##faizan#', 'Lahore', '0312-1746332'),
                        (6, 'Farooq','Ali', 'ali00@gmail.com', '##ali000#', 'Islamabad', '0333-2398000'),
                        (7, 'Aleem','Anwar', 'anwaraleem00@gmail.com', '##aleemanwar32#', 'Faisalabad', '0345-9087605'),
                        (8, 'Haseeb','Ahmad', 'haseeb000@gmail.com', '##haseeb113#', 'Karachi', '0319-9087453'),
                        (9, 'Hashim','Mohsin', 'mohsin000@gmail.com', '##mohsin907#', 'Islamabad', '0318-7898980'),
                        (10, 'Sarmad','waheed', 'waheedahmad000@gmail.com', '##waheed000#', 'Karachi', '0312-9887678'),
                        (11, 'haziq','Sattar', 'haziqsattar@gmail.com', '##haziq36300#', 'Lahore', '0349-9098721');

select * from olx2.users;

create table olx2.post_ad(
		post_id int,
        seller_post_id int,
        buyer_id int,
        post_title varchar(220)
);

insert into olx2.post_ad values(1, 1, null,'Mobile Phones'),
								(2, 1, null, 'Laptops'),
                                (3, 2, 1, 'vehicles');

create table olx2.products(
		product_id int,
        product_name varchar(225),
        category_id int
);

insert into olx2.products values(1, 'iPhone X', null),
								(2, 'Dell', 1),
                                (3, 'Car', 2);

create table olx2.categories(
		c_id int,
        price int
);

insert into olx2.categories values(1, 100000),
								  (2, 150000);
insert into olx2.categories values(3, 2000000);



create table olx2.images(
		image_id int,
        image_description varchar(220),
        image varchar(500),
        image_title char(20),
        p_id int
);

insert into olx2.images values(1, 'Mobiles', 'https://cdn.homeshopping.pk/product_images/uploaded_images/iphx3.png','Iphone x',2),
				(2, 'Mobiles', 'https://lazajgsm.com/wp-content/uploads/2019/09/Iphone-X-64GB-main.jpg', 'iphone', 2);
insert into olx2.images values (3, 'Mobile', 'https://lazajgsm.com/wp-content/uploads/2019/09/Iphone-X-64GB-main.jpg', 'Apple', 2);










select olx2.users.f_name, olx2.users.user_email,olx2.users.user_password,olx2.users.user_location,olx2.post_ad.post_title,
			olx2.post_ad.seller_post_id
from olx2.users
inner join olx2.post_ad ON 
olx2.users.user_id = olx2.post_ad.seller_post_id;









select olx2.users.f_name, olx2.users.l_name,olx2.users.user_id ,  
 group_concat(olx2.images.image_description, '') AS image_description, 
 group_concat(olx2.images.image_id, '') AS image_id,
 group_concat(olx2.images.image) AS Images,
 group_concat(olx2.post_ad.post_title, '') AS post_title
 from olx2.users
 INNER JOIN olx2.post_ad    
 ON olx2.users.user_id = olx2.post_ad.seller_post_id
 Inner join olx2.images
 on olx2.post_ad.post_id = olx2.images. p_id;
 
 
 
 
 
