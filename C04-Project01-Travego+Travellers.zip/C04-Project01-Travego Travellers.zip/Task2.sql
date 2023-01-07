#1 a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select count(gender),gender from passenger where distance>=600 group by gender;

#2 b.	Find the minimum ticket price of a Sleeper Bus. 
select bus_type,min(price) from price where Bus_type = 'Sleeper';

#3 c.	Select passenger names whose names start with character 'S' 
select passenger_name from passenger where passenger_name like 'S%';

#4 d.Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, 
#Bus_Type, Price in the output
select a.passenger_id, a.passenger_name, a.boarding_city, a.destination_city, a.bus_type, b.price from passenger as a
left join price as b
on a.distance = b.distance
group by Passenger_id;

#5 e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select a.passenger_name,a.bus_type, b.price from passenger a
left join price b
on a.distance = b.distance
where a.distance >= 1000
and a.bus_type = 'sitting';

#6 f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select a.passenger_name, a.destination_city as boarding_city, a.boarding_city as destination_city , b.bus_type, b.price from passenger a 
left join price b
on a.distance = b.distance
where passenger_name= 'pallavi';

#7 g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.  
select distinct distance from passenger order by distance desc;

#8 h.	Display the passenger name and percentage of distance traveled by that passenger 
#  from the total distance traveled by all passengers without using user variables 
select passenger_name, Distance* 100/(select sum(distance) from passenger) as percentage_of_distance_travelled
 from passenger group by distance;