CREATE TABLE email (
 id INT NOT NULL,
 email_address UNIQUE VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 age VARCHAR(500),
 home_address VARCHAR(500),
 salary_per_hour VARCHAR(500) NOT NULL,
 person_number UNIQUE VARCHAR(500) NOT NULL,
 instrument_type VARCHAR(500) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE monthly_salary (
 instructor_id INT NOT NULL,
 date_of_payment TIMESTAMP(50),
 amount_to_pay VARCHAR(500)
);

ALTER TABLE monthly_salary ADD CONSTRAINT PK_monthly_salary PRIMARY KEY (instructor_id);


CREATE TABLE number_of_lessons (
 instructor_id INT NOT NULL,
 count_advanced_group_lessons VARCHAR(500),
 count_advanced_individual_lessons VARCHAR(500),
 count_intermediate_group_lessons VARCHAR(500),
 count_intermediate_individual_lessons VARCHAR(500),
 count_beginner_group_lessons VARCHAR(500),
 count_beginner_individual_lessons VARCHAR(500)
);

ALTER TABLE number_of_lessons ADD CONSTRAINT PK_number_of_lessons PRIMARY KEY (instructor_id);


CREATE TABLE phone (
 id INT NOT NULL,
 phone_number UNIQUE VARCHAR(500) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE schedule (
 instructor_id INT NOT NULL,
 available_time TIMESTAMP(50) NOT NULL
);

ALTER TABLE schedule ADD CONSTRAINT PK_schedule PRIMARY KEY (instructor_id);


CREATE TABLE student (
 id INT NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500),
 home_address VARCHAR(500),
 person_number UNIQUE VARCHAR(500) NOT NULL,
 age VARCHAR(500)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_email (
 student_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE student_email ADD CONSTRAINT PK_student_email PRIMARY KEY (student_id,email_id);


CREATE TABLE student_phone (
 student_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE student_phone ADD CONSTRAINT PK_student_phone PRIMARY KEY (student_id,phone_id);


CREATE TABLE application (
 student_id INT NOT NULL,
 genre_of_music VARCHAR(500),
 skill_level VARCHAR(50) NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_id);


CREATE TABLE booking (
 instructor_id INT NOT NULL,
 lesson_type VARCHAR(500),
 booking_time TIMESTAMP(50)
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (instructor_id);


CREATE TABLE ensemble (
 id INT NOT NULL,
 scheduled_time_slot TIMESTAMP(50) NOT NULL,
 target_genre VARCHAR(500) NOT NULL,
 min_student_req VARCHAR(500) NOT NULL,
 max_student_req VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL,
 school_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE group_lesson (
 id INT NOT NULL,
 min_student_req VARCHAR(500) NOT NULL,
 max_student_req VARCHAR(500) NOT NULL,
 scheduled_time_slot TIMESTAMP(50) NOT NULL,
 venue VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL,
 skill_level VARCHAR(500) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id INT NOT NULL,
 available_time TIMESTAMP(50) NOT NULL,
 instructor_id INT NOT NULL,
 skill_level VARCHAR(500) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE monthly_fee (
 student_id INT NOT NULL,
 instructor_id INT NOT NULL,
 total_sum VARCHAR(500),
 group_advanced_price VARCHAR(500) NOT NULL,
 individual_advanced_price VARCHAR(500) NOT NULL,
 group_intermediate_price VARCHAR(500) NOT NULL,
 individual_intermediate_price VARCHAR(500) NOT NULL,
 group_beginner_price VARCHAR(500) NOT NULL,
 individual_beginner_price VARCHAR(500) NOT NULL
);

ALTER TABLE monthly_fee ADD CONSTRAINT PK_monthly_fee PRIMARY KEY (student_id,instructor_id);


CREATE TABLE parent (
 student_id INT NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500),
 age VARCHAR(500),
 home_address VARCHAR(500),
 person_number UNIQUE VARCHAR(500) NOT NULL
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (student_id);


CREATE TABLE rent_instrument (
 student_id INT NOT NULL,
 price_monthly VARCHAR(500) NOT NULL,
 start_leasing TIMESTAMP(50) NOT NULL,
 quantity_of_instrument VARCHAR(500) NOT NULL,
 brand_type VARCHAR(500) NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 return_leased_instrument TIMESTAMP(50) NOT NULL,
 brand_price VARCHAR(500) NOT NULL,
 instrument_type_price VARCHAR(500) NOT NULL
);

ALTER TABLE rent_instrument ADD CONSTRAINT PK_rent_instrument PRIMARY KEY (student_id);


CREATE TABLE school (
 id INT NOT NULL,
 avalible_seats VARCHAR(500) NOT NULL,
 address_of_school VARCHAR(500),
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE school ADD CONSTRAINT PK_school PRIMARY KEY (id);


CREATE TABLE siblings (
 student_id INT NOT NULL,
 number_of_siblings VARCHAR(500)
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (student_id);


CREATE TABLE discount (
 id INT NOT NULL,
 discount_rate VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (id);


ALTER TABLE monthly_salary ADD CONSTRAINT FK_monthly_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE number_of_lessons ADD CONSTRAINT FK_number_of_lessons_0 FOREIGN KEY (instructor_id) REFERENCES monthly_salary (instructor_id);


ALTER TABLE schedule ADD CONSTRAINT FK_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE student_email ADD CONSTRAINT FK_student_email_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_email ADD CONSTRAINT FK_student_email_1 FOREIGN KEY (email_id) REFERENCES email (id);


ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (instructor_id) REFERENCES schedule (instructor_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (school_id) REFERENCES student (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE monthly_fee ADD CONSTRAINT FK_monthly_fee_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE monthly_fee ADD CONSTRAINT FK_monthly_fee_1 FOREIGN KEY (instructor_id) REFERENCES number_of_lessons (instructor_id);


ALTER TABLE parent ADD CONSTRAINT FK_parent_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE school ADD CONSTRAINT FK_school_0 FOREIGN KEY (instructor_id) REFERENCES booking (instructor_id);
ALTER TABLE school ADD CONSTRAINT FK_school_1 FOREIGN KEY (student_id) REFERENCES application (student_id);
ALTER TABLE school ADD CONSTRAINT FK_school_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE discount ADD CONSTRAINT FK_discount_0 FOREIGN KEY (instructor_id,student_id) REFERENCES monthly_fee (instructor_id,student_id);
ALTER TABLE discount ADD CONSTRAINT FK_discount_1 FOREIGN KEY (student_id) REFERENCES siblings (student_id);


