create schema hospital;
set search_path to hospital;


CREATE TABLE patient (
p_id DECIMAL(9,0),
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20),
gender CHAR(1),
phone_number varchar(15) NOT NULL,
dob DATE,
emergency_contact varchar(15),
address VARCHAR(80),
PRIMARY KEY (p_id)
);


CREATE TABLE patient_medical_history (

p_id DECIMAL(9,0),
medical_history VARCHAR(50),
primary key(p_id,medical_history),
foreign key(p_id) references patient(p_id)
ON DELETE SET DEFAULT ON UPDATE CASCADE
);


CREATE TABLE employee (
e_id DECIMAL(9,0),
e_type varchar(3) NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20),
dob DATE,
address VARCHAR(80) NOT NULL,
gender CHAR(1),
phone_number varchar(15) NOT NULL,
emergency_contact varchar(15),
date_of_joining DATE NOT NULL,
date_of_resigning DATE ,
PRIMARY KEY (e_id)
);




CREATE TABLE room_type
(
room_type varchar(50),
room_cost int NOT NULL,
PRIMARY KEY (room_type, room_cost)
);

create type room_no_type as enum('GW001',
'SSP002',
'SP003',
'DX004',
'SSP005',
'SU101',
'SSP102',
'SSP103',
'SP104',
'DX105',
'ICU201',
'OT202',
'SU203',
'SSP204',
'OT301',
'OT302',
'SP303',
'GW304',
'DX305',
'GW401',
'SU402',
'OT403',
'DX404',
'SSP405' );


CREATE TABLE room_details(
room_no room_no_type unique,
room_type varchar(50) NOT NULL,
room_cost int NOT NULL,
occupied_status int NOT NULL,
PRIMARY KEY (room_no),
Foreign key (room_type, room_cost) references room_type(room_type,room_cost)
ON DELETE SET DEFAULT ON UPDATE CASCADE
);



CREATE TABLE dept (
dept_no SMALLINT,
dept_name VARCHAR(25) NOT NULL,
no_of_deoctors int,
PRIMARY KEY (dept_no)
);


Create table doctors
(
e_id DECIMAL(9,0),
dept_no smallint NOT NULL,
primary key(e_id),
foreign key (e_id) references employee(e_id),    
foreign key (dept_no) references dept(dept_no)
ON DELETE SET DEFAULT ON UPDATE CASCADE
);

create table opd_doctor
(
e_id DECIMAL(9,0),
cons_fee int,
primary key(e_id),
foreign key (e_id) references employee(e_id)
on delete cascade on update cascade
);

create table duty_assigned
(
e_id DECIMAL(9,0),
days char(3) ,
start_shift time ,
end_shift time,
primary key(e_id,days),
foreign key (e_id) references opd_doctor(e_id)
on delete cascade on update cascade
);


create table duty_attendance
(
e_id DECIMAL(9,0),
dates date ,                                              
swipe_in time,
swipe_out time,
primary key(e_id,dates),
foreign key (e_id) references opd_doctor(e_id)
on delete cascade on update cascade
);

create table general_personal
(
e_id DECIMAL(9,0),
charge_hour int not null,
primary key(e_id),
foreign key (e_id) references employee(e_id)
on delete cascade on update cascade
);


create table admitted
(
case_id_admit decimal(9,0),
p_id decimal (9,0) not null,
admit_date date not null,
discharge_date date,
room_no room_no_type not null unique,
primary key(case_id_admit),
foreign key (p_id) references patient(p_id),
foreign key (room_no) references room_details(room_no)
on update cascade on delete cascade
);

create table policy
(
policy_No varchar(15),
policy_name varchar(80),                   
claim_amt int,
primary key(policy_no)
);

create table patient_insurance
(
policy_no varchar(15),
p_id decimal(9,0),
primary key(p_id,policy_no),
foreign key(policy_no) references policy(policy_no),
foreign key (p_id) references patient(p_id)
on delete cascade on update cascade
);

create table provided_healthcare_service
(
service_id varchar(10),
dept_no smallint not null,
service_desc varchar(80) not null,
service_charge int,   
service_code varchar(10),
primary key(service_id),
foreign key (dept_no) references dept(dept_no)
on delete cascade on update cascade                   
);


create table opd_bill
(
case_id_opd decimal(9,0),
p_id DECIMAL(9,0),
e_id DECIMAL(9,0),
opd_charge int,
diagnosis varchar(80),
primary key (case_id_opd),
foreign key(p_id) references patient(p_id),
foreign key (e_id) references opd_doctor(e_id)
on update cascade on delete cascade
);



create table interm_bill
(
case_id_admit DECIMAL(9,0),
bill_id DECIMAL(9,0),
p_id DECIMAL(9,0) not null,
room_no room_no_type,
room_cost int,
service_id varchar (10),
service_charge int,
opd_charge int,
primary key(case_id_admit,bill_id),
foreign key(case_id_admit) references admitted(case_id_admit),
foreign key(p_id) references patient(p_id),
foreign key(service_id) references provided_healthcare_service(service_id),
foreign key(room_no) references room_details(room_no)
on delete cascade on update cascade
);


create table final_bill
(
case_id_admit decimal(9,0),
p_id DECIMAL(9,0) not null,
policy_no varchar(80),
claim_accepted  decimal(9,2),
total_charge int,
payable_amt decimal(9,2),
primary key(case_id_admit),
foreign key(p_id) references patient(p_id),
foreign key(policy_no) references policy(policy_no),
foreign key(case_id_admit) references admitted(case_id_admit)
on delete cascade on update cascade
);


create table discharge_summary
(
case_id_admit decimal(9,0),
pid decimal(9,0),
admit_diagnosis varchar(100),         
primary key(case_id_admit),
foreign key (case_id_admit) references Admitted (case_id_admit),
foreign key (pid) references patient(p_id)
on delete cascade on update cascade             
)