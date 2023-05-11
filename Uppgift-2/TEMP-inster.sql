-- Detta dokument är fyllt med viss slumpmässig data för det triviala
-- delarna av skolans databassystem för att möjliggöra vissa tester

-- student
-- parent
-- instructor
-- group_lesson
-- rent_instrument
-- email
-- monthly_salary
-- phone
-- application
-- ensemble
-- individual_lesson
-- school
-- siblings
-- booking
-- discount
-- monthly_fee
-- number_of_lessons
-- schedule

INSERT INTO student (first_name,last_name,home_address,person_number,age,id) VALUES
('Thomas', 'Gustafsson','Fjalkinge Nastvattnet 74','200210074567','20','0'),
('Adam', 'Lilienberg','Viken Lantmannagatan 77','199309276134','29','1'),
('Viktor', 'Björken','Ostersund Stallstigen 41','200001024961','22','2');


INSERT INTO parent (first_name,last_name,age,home_address,person_number,student_id) VALUES
('Oscar', 'Gustafsson','50','Fjalkinge Nastvattnet 74','197211066567','0'),
('Simon', 'Lilienberg','55','Viken Lantmannagatan 77','196706276136','1'),
('Hugo', 'Björken','60','Ostersund Stallstigen 41','196202034461','2');


INSERT INTO instructor (first_name,last_name,age,home_address,salary_per_hour,person_number,instrument_type,id) VALUES
('Elis', 'Gunnarsson','22','Forsvik  Framsteby Vena 32','225','200012074587','Piano,Guitar','0'),
('Oscar', 'Raftewold','20','Dala-jarna Nojesgatan 98','215','200205276154','Violin,Trumpet','1'),
('Erik', 'Lundsten','20','Vikbolandet Hagaskog 14','215','200201124931','Drums,Piano,Guitar','2');


INSERT INTO group_lesson (min_student_req,max_student_req,scheduled_time_slot,venue,instructor_id,skill_level,student_id,id) VALUES
('2', '5','2022.11.28 10:00:00','ZOOM','0','beginner','0','0'),
('2', '5','2022.11.29 10:00:00','ZOOM','1','intermediate','1','1'),
('2', '5','2022.11.30 10:00:00','ZOOM','2', 'advanced','2','2');

INSERT INTO rent_instrument (price_monthly,start_leasing,quantity_of_instrument,brand_type,instrument_type,return_leased_instrument,instrument_type_price,brand_price,student_id) VALUES
('200', '2022.11.20 10:00:00','1','Gibson','Guitar','2023.10.20 10:00:00','Guitar=200','Gibson Guitar = 200','0'),
('400', '2022.11.20 10:00:00','2','Yamaha','Guitar,Piano','2023.10.20 10:00:00','Guitar=100 Piano=300','Yamaha Guitar = 100 Yamaha Piano = 300','1'),
('600', '2022.11.20 10:00:00','3','Yamaha','Trumpet,Drums,Guitar','2023.10.20 10:00:00','Trumpet=200 Drums=300 Guitar=100','Yamaha Trumpet = 200 Yamaha Drums = 300 Yamaha Guitar = 100','2');

INSERT INTO email (id,email_address) VALUES
('0','johnwick@gmail.com'),
('1','shrekgreenmachine@live.se'),
('2', 'milesdavis112@icloud.com');

INSERT INTO monthly_salary (instructor_id,date_of_payment,amount_to_pay) VALUES
('0','2022.12.25 00:00:00','37000'),
('1','2022.12.25 00:00:00', '32000'),
('2','2022.12.25 00:00:00', '35000');

INSERT INTO phone (id,phone_number) VALUES
('0','0704355324'),
('1','0708549322'),
('2','0709679933');

INSERT INTO application (student_id,genre_of_music,skill_level) VALUES
('0','jazz', 'beginner'),
('1', 'blues', 'intermediate'),
('2', 'classic', 'advnaced');

INSERT INTO ensemble (id,scheduled_time_slot,target_genre,min_student_req,max_student_req,instructor_id,school_id) VALUES
('0','2022.12.12 11:00:00', 'jazz', '2','5','2','0'),
('1','2022.12.13 11:00:00', 'blues', '2','5','0','0'),
('2','2022.12.12 11:00:00', 'classic','2' ,'5','1','0');

INSERT INTO schedule (available_time,instructor_id) VALUES
('2022.11.28 10:00','0'),
('2022.11.29 10:00','1'),
('2022.11.30 10:00','2');

INSERT INTO number_of_lessons (count_advanced_group_lessons,count_advanced_individual_lessons,count_intermediate_group_lessons,count_intermediate_individual_lessons,count_beginner_group_lessons,count_beginner_individual_lessons,instructor_id) VALUES
('2','4','2','3','1','5','0'),
('1','3','1','2','0','4','1'),
('3','5','3','4','2','6','2');

INSERT INTO monthly_fee (total_sum,group_advanced_price,individual_advanced_price,group_intermediate_price,individual_intermediate_price,group_beginner_price,individual_beginner_price,student_id,instructor_id) VALUES
('8775','400','600','375','575','350','550','0','0'),
('5925','400','600','375','575','350','550','1','1'),
('11625','400','600','375','575','350','550','2','2');

INSERT INTO discount (discount_rate,id,instructor_id,student_id) VALUES
('25%','11','0','0'),
('25%','12','1','1'),
('25%','13','2','2');

INSERT INTO booking (lesson_type,booking_time,instructor_id) VALUES
('individual_lesson','2022.12.28 13:00','0'),
('ensemble','2022.12.29 14:00','1'),
('gruo_lesson','2022.12.30 16:00','2');

INSERT INTO siblings (number_of_siblings,student_id,id) VALUES
('0','1','0'),
('0','2','1'),
('0','3','2');

INSERT INTO school (avalible_seats,address_of_school,student_id,instructor_id,id) VALUES
('100','Rorstrandsgatan 82 b','0','0','0'),
('100','Rorstrandsgatan 82 b','1','1','0'),
('100','Rorstrandsgatan 82 b','2','2','0');

INSERT INTO individual_lesson (available_time,instructor_id,skill_level,student_id,individual_lesson_id) VALUES
('2022.12.28 13:00','0','beginner','0','0'),
('2022.12.29 14:00','1','intermediate','1','0'),
('2022.12.30 16:00','2','advanced','2','0');
