create table day5.users(
		userid INT,
		Name varchar(220),
		email varchar(220)	
	);

	insert into day5.users values(1, 'Azeem', 'azeemshoukat000@gmail.com'),
							(2, 'Ahmad', 'ahmad000@gmail.com'),
							(3, 'Aali', 'ali@gmail.com'),
							(4, 'Faheem', 'faheem@gmail.com'),
							(5, 'Rehman', 'rehman@gmail.com'),
							(6, 'faizan', 'faizan@gmail.com'),
							(7, 'rohaan', 'rohan@gmail.com'),
							(8, 'yahya', 'yahya@gmail.com');
                            
                            
	create table day5.tasks1(
			task_id int ,
		    userid int ,
			tasktitle varchar (20),
			TaskDescription varchar(25),
			TaskStatus char(20)		
		);	
        
        
        
		insert into day5.tasks1 values(1, 2, 'make table', 'make table in database', 'completed'),
									  (2, 3, 'use a table', 'use table in database', 'pending'),
									  (3, 4, 'insert value', 'insert value in table1', 'pending'),
								      (4, 5, 'apply joins', 'joins on a table', 'completed'),
									  (5, 6, 'left join', 'apply left join', 'completed'),
								      (6, 7, 'right join', 'apply right join', 'completed'),
								      (7, 4, 'full join', 'apply full join', 'pending'),
								      (8, 4, 'make table', 'make task table', 'pending');
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
		
        
		select day5.users.userid, GROUP_CONCAT(day5.tasks1.taskStatus) AS task_status, COUNT(day5.tasks1.userid) AS totaltasks, day5.users.Name
		from day5.users
		left join day5.tasks1 on day5.tasks1.userid = day5.users.userid
		group by day5.users.userid, day5.users.Name, day5.tasks1.TaskStatus;
        
        
        
        
        
        select day5.tasks1.TaskStatus, day5.users.Name,COUNT(day5.tasks1.userid) AS totaltasks, day5.users.userid
		from (day5.users 
		inner join day5.tasks1 on day5.users.userid = day5.tasks1.userid)
		group by day5.tasks1.TaskStatus, day5.users.Name
		having day5.tasks1.TaskStatus = 'pending' AND COUNT(day5.tasks1.userid) > 2;
        
        
        
        
		select day5.users.Name, day5.tasks1.userid
		from day5.users
		left outer join day5.tasks1 on day5.users.userid = day5.tasks1.userid
		where day5.tasks1.userid is NULL 
		
        
        
        
        
        
        
        
        

