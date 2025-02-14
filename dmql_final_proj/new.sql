PGDMP     $                    {           new    15.2    15.2 U    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16401    new    DATABASE     e   CREATE DATABASE new WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE new;
                postgres    false                        2615    16402    hospital    SCHEMA        CREATE SCHEMA hospital;
    DROP SCHEMA hospital;
                postgres    false            X           1247    16404    room_no_type    TYPE     m  CREATE TYPE hospital.room_no_type AS ENUM (
    'GW001',
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
    'SSP405'
);
 !   DROP TYPE hospital.room_no_type;
       hospital          postgres    false    6            �            1259    16453    dept    TABLE     �   CREATE TABLE hospital.dept (
    dept_no smallint NOT NULL,
    dept_name character varying(25) NOT NULL,
    no_of_doctors integer
);
    DROP TABLE hospital.dept;
       hospital         heap    postgres    false    6            �            1259    16456    discharge_summary    TABLE     �   CREATE TABLE hospital.discharge_summary (
    case_id_admit numeric(9,0) NOT NULL,
    p_id numeric(9,0),
    admit_diagnosis character varying(100)
);
 '   DROP TABLE hospital.discharge_summary;
       hospital         heap    postgres    false    6            �            1259    16459    doctors    TABLE     a   CREATE TABLE hospital.doctors (
    e_id numeric(9,0) NOT NULL,
    dept_no smallint NOT NULL
);
    DROP TABLE hospital.doctors;
       hospital         heap    postgres    false    6            �            1259    16462    duty_assigned    TABLE     �   CREATE TABLE hospital.duty_assigned (
    e_id numeric(9,0) NOT NULL,
    days character(3) NOT NULL,
    start_shift time without time zone,
    end_shift time without time zone
);
 #   DROP TABLE hospital.duty_assigned;
       hospital         heap    postgres    false    6            �            1259    16465    duty_attendance    TABLE     �   CREATE TABLE hospital.duty_attendance (
    e_id numeric(9,0) NOT NULL,
    date date NOT NULL,
    swipe_in time without time zone,
    swipe_out time without time zone
);
 %   DROP TABLE hospital.duty_attendance;
       hospital         heap    postgres    false    6            �            1259    16468    employee    TABLE     �  CREATE TABLE hospital.employee (
    e_id numeric(9,0) NOT NULL,
    e_type character varying(3) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20),
    dob date,
    address character varying(80) NOT NULL,
    gender character(1),
    phone_number character varying(15) NOT NULL,
    emergency_contact character varying(15),
    date_of_joining date NOT NULL,
    date_of_resigning date
);
    DROP TABLE hospital.employee;
       hospital         heap    postgres    false    6            �            1259    16471    general_personal    TABLE     m   CREATE TABLE hospital.general_personal (
    e_id numeric(9,0) NOT NULL,
    "charge/hour" money NOT NULL
);
 &   DROP TABLE hospital.general_personal;
       hospital         heap    postgres    false    6            �            1259    16474    interm_bill    TABLE     �   CREATE TABLE hospital.interm_bill (
    case_id_admit numeric(9,0) NOT NULL,
    bill_id numeric(9,0) NOT NULL,
    p_id numeric(9,0) NOT NULL,
    room_cost integer,
    service_charge integer,
    opd_charge integer
);
 !   DROP TABLE hospital.interm_bill;
       hospital         heap    postgres    false    6            �            1259    16477    opd_bill    TABLE     �   CREATE TABLE hospital.opd_bill (
    case_id_opd numeric(9,0) NOT NULL,
    p_id numeric(9,0),
    e_id numeric(9,0),
    opd_charge money,
    diagnosis character varying(80)
);
    DROP TABLE hospital.opd_bill;
       hospital         heap    postgres    false    6            �            1259    16480 
   opd_doctor    TABLE     \   CREATE TABLE hospital.opd_doctor (
    e_id numeric(9,0) NOT NULL,
    consult_fee money
);
     DROP TABLE hospital.opd_doctor;
       hospital         heap    postgres    false    6            �            1259    16483    patient    TABLE     _  CREATE TABLE hospital.patient (
    p_id numeric(9,0) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20),
    gender character(1),
    phone_number character varying(15) NOT NULL,
    dob date,
    emergency_contact character varying(15),
    address character varying(80),
    email character varying(50)
);
    DROP TABLE hospital.patient;
       hospital         heap    postgres    false    6            �            1259    16486    patient_admit    TABLE     �   CREATE TABLE hospital.patient_admit (
    case_id_admit numeric(9,0) NOT NULL,
    p_id numeric(9,0) NOT NULL,
    admit_date date NOT NULL,
    discharge_date date,
    r_no hospital.room_no_type NOT NULL
);
 #   DROP TABLE hospital.patient_admit;
       hospital         heap    postgres    false    856    6            �            1259    16489    patient_insurance    TABLE     z   CREATE TABLE hospital.patient_insurance (
    policy_no character varying(15) NOT NULL,
    p_id numeric(9,0) NOT NULL
);
 '   DROP TABLE hospital.patient_insurance;
       hospital         heap    postgres    false    6            �            1259    16492    patient_medical_history    TABLE     �   CREATE TABLE hospital.patient_medical_history (
    p_id numeric(9,0) NOT NULL,
    medical_history character varying(50) NOT NULL
);
 -   DROP TABLE hospital.patient_medical_history;
       hospital         heap    postgres    false    6            �            1259    16495    policy    TABLE     �   CREATE TABLE hospital.policy (
    policy_no character varying(15) NOT NULL,
    policy_name character varying(80),
    claim_amt money
);
    DROP TABLE hospital.policy;
       hospital         heap    postgres    false    6            �            1259    16498    provided_healthcare_service    TABLE     �   CREATE TABLE hospital.provided_healthcare_service (
    service_id character varying NOT NULL,
    dept_no smallint NOT NULL,
    service_desc character varying(50) NOT NULL,
    service_charge money,
    service_code character(50)
);
 1   DROP TABLE hospital.provided_healthcare_service;
       hospital         heap    postgres    false    6            �            1259    16503    room_detail    TABLE     �   CREATE TABLE hospital.room_detail (
    room_no hospital.room_no_type NOT NULL,
    room_type character varying(5) NOT NULL,
    occupied_status integer,
    cost integer
);
 !   DROP TABLE hospital.room_detail;
       hospital         heap    postgres    false    6    856            �            1259    16506 	   room_type    TABLE     p   CREATE TABLE hospital.room_type (
    room_type character varying(50) NOT NULL,
    room_cost money NOT NULL
);
    DROP TABLE hospital.room_type;
       hospital         heap    postgres    false    6            �            1259    16509 
   total_bill    TABLE     �   CREATE TABLE hospital.total_bill (
    case_id_admit numeric(9,0) NOT NULL,
    p_id numeric(9,0) NOT NULL,
    policy_no character varying(80),
    claim_accepted numeric(9,2),
    total_charge numeric(9,2),
    payable_amt numeric(9,2)
);
     DROP TABLE hospital.total_bill;
       hospital         heap    postgres    false    6            �          0    16453    dept 
   TABLE DATA           C   COPY hospital.dept (dept_no, dept_name, no_of_doctors) FROM stdin;
    hospital          postgres    false    215   r       �          0    16456    discharge_summary 
   TABLE DATA           S   COPY hospital.discharge_summary (case_id_admit, p_id, admit_diagnosis) FROM stdin;
    hospital          postgres    false    216   �r       �          0    16459    doctors 
   TABLE DATA           2   COPY hospital.doctors (e_id, dept_no) FROM stdin;
    hospital          postgres    false    217   w       �          0    16462    duty_assigned 
   TABLE DATA           M   COPY hospital.duty_assigned (e_id, days, start_shift, end_shift) FROM stdin;
    hospital          postgres    false    218   .w       �          0    16465    duty_attendance 
   TABLE DATA           L   COPY hospital.duty_attendance (e_id, date, swipe_in, swipe_out) FROM stdin;
    hospital          postgres    false    219   Nx       �          0    16468    employee 
   TABLE DATA           �   COPY hospital.employee (e_id, e_type, first_name, last_name, dob, address, gender, phone_number, emergency_contact, date_of_joining, date_of_resigning) FROM stdin;
    hospital          postgres    false    220   ��       �          0    16471    general_personal 
   TABLE DATA           A   COPY hospital.general_personal (e_id, "charge/hour") FROM stdin;
    hospital          postgres    false    221   u�       �          0    16474    interm_bill 
   TABLE DATA           l   COPY hospital.interm_bill (case_id_admit, bill_id, p_id, room_cost, service_charge, opd_charge) FROM stdin;
    hospital          postgres    false    222   c�       �          0    16477    opd_bill 
   TABLE DATA           T   COPY hospital.opd_bill (case_id_opd, p_id, e_id, opd_charge, diagnosis) FROM stdin;
    hospital          postgres    false    223   L�       �          0    16480 
   opd_doctor 
   TABLE DATA           9   COPY hospital.opd_doctor (e_id, consult_fee) FROM stdin;
    hospital          postgres    false    224   Ƣ       �          0    16483    patient 
   TABLE DATA           ~   COPY hospital.patient (p_id, first_name, last_name, gender, phone_number, dob, emergency_contact, address, email) FROM stdin;
    hospital          postgres    false    225   )�       �          0    16486    patient_admit 
   TABLE DATA           `   COPY hospital.patient_admit (case_id_admit, p_id, admit_date, discharge_date, r_no) FROM stdin;
    hospital          postgres    false    226   L�       �          0    16489    patient_insurance 
   TABLE DATA           >   COPY hospital.patient_insurance (policy_no, p_id) FROM stdin;
    hospital          postgres    false    227   �       �          0    16492    patient_medical_history 
   TABLE DATA           J   COPY hospital.patient_medical_history (p_id, medical_history) FROM stdin;
    hospital          postgres    false    228   W�       �          0    16495    policy 
   TABLE DATA           E   COPY hospital.policy (policy_no, policy_name, claim_amt) FROM stdin;
    hospital          postgres    false    229   ��       �          0    16498    provided_healthcare_service 
   TABLE DATA           x   COPY hospital.provided_healthcare_service (service_id, dept_no, service_desc, service_charge, service_code) FROM stdin;
    hospital          postgres    false    230   $�       �          0    16503    room_detail 
   TABLE DATA           R   COPY hospital.room_detail (room_no, room_type, occupied_status, cost) FROM stdin;
    hospital          postgres    false    231   ��       �          0    16506 	   room_type 
   TABLE DATA           ;   COPY hospital.room_type (room_type, room_cost) FROM stdin;
    hospital          postgres    false    232   ��       �          0    16509 
   total_bill 
   TABLE DATA           q   COPY hospital.total_bill (case_id_admit, p_id, policy_no, claim_accepted, total_charge, payable_amt) FROM stdin;
    hospital          postgres    false    233   -�       �           2606    16513    patient_admit admitted_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY hospital.patient_admit
    ADD CONSTRAINT admitted_pkey PRIMARY KEY (case_id_admit);
 G   ALTER TABLE ONLY hospital.patient_admit DROP CONSTRAINT admitted_pkey;
       hospital            postgres    false    226            �           2606    16515    opd_bill consultation_bill_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY hospital.opd_bill
    ADD CONSTRAINT consultation_bill_pkey PRIMARY KEY (case_id_opd);
 K   ALTER TABLE ONLY hospital.opd_bill DROP CONSTRAINT consultation_bill_pkey;
       hospital            postgres    false    223            �           2606    16517    dept department_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY hospital.dept
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_no);
 @   ALTER TABLE ONLY hospital.dept DROP CONSTRAINT department_pkey;
       hospital            postgres    false    215            �           2606    16519 (   discharge_summary discharge_summary_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY hospital.discharge_summary
    ADD CONSTRAINT discharge_summary_pkey PRIMARY KEY (case_id_admit);
 T   ALTER TABLE ONLY hospital.discharge_summary DROP CONSTRAINT discharge_summary_pkey;
       hospital            postgres    false    216            �           2606    16521    doctors doctors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY hospital.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (e_id);
 @   ALTER TABLE ONLY hospital.doctors DROP CONSTRAINT doctors_pkey;
       hospital            postgres    false    217            �           2606    16523    employee employee_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY hospital.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (e_id);
 B   ALTER TABLE ONLY hospital.employee DROP CONSTRAINT employee_pkey;
       hospital            postgres    false    220            �           2606    16525    total_bill final_bill_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY hospital.total_bill
    ADD CONSTRAINT final_bill_pkey PRIMARY KEY (case_id_admit);
 F   ALTER TABLE ONLY hospital.total_bill DROP CONSTRAINT final_bill_pkey;
       hospital            postgres    false    233            �           2606    16527 #   general_personal general_staff_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY hospital.general_personal
    ADD CONSTRAINT general_staff_pkey PRIMARY KEY (e_id);
 O   ALTER TABLE ONLY hospital.general_personal DROP CONSTRAINT general_staff_pkey;
       hospital            postgres    false    221            �           2606    16529 "   interm_bill intermediate_bill_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY hospital.interm_bill
    ADD CONSTRAINT intermediate_bill_pkey PRIMARY KEY (case_id_admit, bill_id);
 N   ALTER TABLE ONLY hospital.interm_bill DROP CONSTRAINT intermediate_bill_pkey;
       hospital            postgres    false    222    222            �           2606    16531 #   duty_attendance opd_attendance_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY hospital.duty_attendance
    ADD CONSTRAINT opd_attendance_pkey PRIMARY KEY (e_id, date);
 O   ALTER TABLE ONLY hospital.duty_attendance DROP CONSTRAINT opd_attendance_pkey;
       hospital            postgres    false    219    219            �           2606    16533 #   duty_assigned opd_availability_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY hospital.duty_assigned
    ADD CONSTRAINT opd_availability_pkey PRIMARY KEY (e_id, days);
 O   ALTER TABLE ONLY hospital.duty_assigned DROP CONSTRAINT opd_availability_pkey;
       hospital            postgres    false    218    218            �           2606    16535    opd_doctor opd_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY hospital.opd_doctor
    ADD CONSTRAINT opd_pkey PRIMARY KEY (e_id);
 ?   ALTER TABLE ONLY hospital.opd_doctor DROP CONSTRAINT opd_pkey;
       hospital            postgres    false    224            �           2606    16537 $   patient patient_general_details_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY hospital.patient
    ADD CONSTRAINT patient_general_details_pkey PRIMARY KEY (p_id);
 P   ALTER TABLE ONLY hospital.patient DROP CONSTRAINT patient_general_details_pkey;
       hospital            postgres    false    225            �           2606    16539 0   patient_insurance patient_insurance_details_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY hospital.patient_insurance
    ADD CONSTRAINT patient_insurance_details_pkey PRIMARY KEY (p_id, policy_no);
 \   ALTER TABLE ONLY hospital.patient_insurance DROP CONSTRAINT patient_insurance_details_pkey;
       hospital            postgres    false    227    227            �           2606    16541 7   patient_medical_history patient_medical_conditions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_medical_history
    ADD CONSTRAINT patient_medical_conditions_pkey PRIMARY KEY (p_id, medical_history);
 c   ALTER TABLE ONLY hospital.patient_medical_history DROP CONSTRAINT patient_medical_conditions_pkey;
       hospital            postgres    false    228    228            �           2606    16543    policy policy_details_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY hospital.policy
    ADD CONSTRAINT policy_details_pkey PRIMARY KEY (policy_no);
 F   ALTER TABLE ONLY hospital.policy DROP CONSTRAINT policy_details_pkey;
       hospital            postgres    false    229            �           2606    16545    room_detail room_details_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY hospital.room_detail
    ADD CONSTRAINT room_details_pkey PRIMARY KEY (room_no);
 I   ALTER TABLE ONLY hospital.room_detail DROP CONSTRAINT room_details_pkey;
       hospital            postgres    false    231            �           2606    16547    room_type room_type_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY hospital.room_type
    ADD CONSTRAINT room_type_pk PRIMARY KEY (room_type);
 B   ALTER TABLE ONLY hospital.room_type DROP CONSTRAINT room_type_pk;
       hospital            postgres    false    232            �           2606    16549 5   provided_healthcare_service treatments_available_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY hospital.provided_healthcare_service
    ADD CONSTRAINT treatments_available_pkey PRIMARY KEY (service_id);
 a   ALTER TABLE ONLY hospital.provided_healthcare_service DROP CONSTRAINT treatments_available_pkey;
       hospital            postgres    false    230            �           2606    16550 &   patient_admit admitted_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_admit
    ADD CONSTRAINT admitted_patient_id_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id);
 R   ALTER TABLE ONLY hospital.patient_admit DROP CONSTRAINT admitted_patient_id_fkey;
       hospital          postgres    false    3535    225    226            �           2606    16555 #   patient_admit admitted_room_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_admit
    ADD CONSTRAINT admitted_room_no_fkey FOREIGN KEY (r_no) REFERENCES hospital.room_detail(room_no) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY hospital.patient_admit DROP CONSTRAINT admitted_room_no_fkey;
       hospital          postgres    false    226    231    3547            �           2606    16560 #   opd_bill consultation_bill_pid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.opd_bill
    ADD CONSTRAINT consultation_bill_pid_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id);
 O   ALTER TABLE ONLY hospital.opd_bill DROP CONSTRAINT consultation_bill_pid_fkey;
       hospital          postgres    false    225    223    3535            �           2606    16565 2   discharge_summary discharge_summary_case_a_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.discharge_summary
    ADD CONSTRAINT discharge_summary_case_a_no_fkey FOREIGN KEY (case_id_admit) REFERENCES hospital.patient_admit(case_id_admit);
 ^   ALTER TABLE ONLY hospital.discharge_summary DROP CONSTRAINT discharge_summary_case_a_no_fkey;
       hospital          postgres    false    3537    216    226            �           2606    16570 ,   discharge_summary discharge_summary_pid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.discharge_summary
    ADD CONSTRAINT discharge_summary_pid_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY hospital.discharge_summary DROP CONSTRAINT discharge_summary_pid_fkey;
       hospital          postgres    false    3535    225    216            �           2606    16575    doctors doctors_dep_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.doctors
    ADD CONSTRAINT doctors_dep_no_fkey FOREIGN KEY (dept_no) REFERENCES hospital.dept(dept_no) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 G   ALTER TABLE ONLY hospital.doctors DROP CONSTRAINT doctors_dep_no_fkey;
       hospital          postgres    false    3515    215    217            �           2606    16580    doctors doctors_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.doctors
    ADD CONSTRAINT doctors_emp_id_fkey FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id);
 G   ALTER TABLE ONLY hospital.doctors DROP CONSTRAINT doctors_emp_id_fkey;
       hospital          postgres    false    220    3525    217            �           2606    16585    duty_assigned e_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.duty_assigned
    ADD CONSTRAINT e_id_fk FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id) NOT VALID;
 A   ALTER TABLE ONLY hospital.duty_assigned DROP CONSTRAINT e_id_fk;
       hospital          postgres    false    3525    218    220            �           2606    16590    duty_attendance e_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.duty_attendance
    ADD CONSTRAINT e_id_fk FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id) NOT VALID;
 C   ALTER TABLE ONLY hospital.duty_attendance DROP CONSTRAINT e_id_fk;
       hospital          postgres    false    220    3525    219            �           2606    16595    opd_bill e_id_fk    FK CONSTRAINT        ALTER TABLE ONLY hospital.opd_bill
    ADD CONSTRAINT e_id_fk FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id) NOT VALID;
 <   ALTER TABLE ONLY hospital.opd_bill DROP CONSTRAINT e_id_fk;
       hospital          postgres    false    220    223    3525            �           2606    16600 $   total_bill final_bill_case_a_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.total_bill
    ADD CONSTRAINT final_bill_case_a_no_fkey FOREIGN KEY (case_id_admit) REFERENCES hospital.patient_admit(case_id_admit) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY hospital.total_bill DROP CONSTRAINT final_bill_case_a_no_fkey;
       hospital          postgres    false    233    226    3537            �           2606    16605 %   total_bill final_bill_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.total_bill
    ADD CONSTRAINT final_bill_patient_id_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id);
 Q   ALTER TABLE ONLY hospital.total_bill DROP CONSTRAINT final_bill_patient_id_fkey;
       hospital          postgres    false    225    3535    233            �           2606    16610 $   total_bill final_bill_policy_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.total_bill
    ADD CONSTRAINT final_bill_policy_no_fkey FOREIGN KEY (policy_no) REFERENCES hospital.policy(policy_no);
 P   ALTER TABLE ONLY hospital.total_bill DROP CONSTRAINT final_bill_policy_no_fkey;
       hospital          postgres    false    3543    233    229            �           2606    16615 *   general_personal general_staff_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.general_personal
    ADD CONSTRAINT general_staff_emp_id_fkey FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY hospital.general_personal DROP CONSTRAINT general_staff_emp_id_fkey;
       hospital          postgres    false    3525    220    221            �           2606    16620 ,   interm_bill intermediate_bill_case_a_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.interm_bill
    ADD CONSTRAINT intermediate_bill_case_a_no_fkey FOREIGN KEY (case_id_admit) REFERENCES hospital.patient_admit(case_id_admit);
 X   ALTER TABLE ONLY hospital.interm_bill DROP CONSTRAINT intermediate_bill_case_a_no_fkey;
       hospital          postgres    false    3537    226    222            �           2606    16625 -   interm_bill intermediate_bill_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.interm_bill
    ADD CONSTRAINT intermediate_bill_patient_id_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id);
 Y   ALTER TABLE ONLY hospital.interm_bill DROP CONSTRAINT intermediate_bill_patient_id_fkey;
       hospital          postgres    false    222    3535    225            �           2606    16630    opd_doctor opd_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.opd_doctor
    ADD CONSTRAINT opd_emp_id_fkey FOREIGN KEY (e_id) REFERENCES hospital.employee(e_id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY hospital.opd_doctor DROP CONSTRAINT opd_emp_id_fkey;
       hospital          postgres    false    3525    220    224            �           2606    16635 ;   patient_insurance patient_insurance_details_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_insurance
    ADD CONSTRAINT patient_insurance_details_patient_id_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id) ON UPDATE CASCADE ON DELETE CASCADE;
 g   ALTER TABLE ONLY hospital.patient_insurance DROP CONSTRAINT patient_insurance_details_patient_id_fkey;
       hospital          postgres    false    3535    227    225            �           2606    16640 :   patient_insurance patient_insurance_details_policy_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_insurance
    ADD CONSTRAINT patient_insurance_details_policy_no_fkey FOREIGN KEY (policy_no) REFERENCES hospital.policy(policy_no);
 f   ALTER TABLE ONLY hospital.patient_insurance DROP CONSTRAINT patient_insurance_details_policy_no_fkey;
       hospital          postgres    false    229    227    3543            �           2606    16645 B   patient_medical_history patient_medical_conditions_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.patient_medical_history
    ADD CONSTRAINT patient_medical_conditions_patient_id_fkey FOREIGN KEY (p_id) REFERENCES hospital.patient(p_id) ON UPDATE CASCADE ON DELETE SET DEFAULT;
 n   ALTER TABLE ONLY hospital.patient_medical_history DROP CONSTRAINT patient_medical_conditions_patient_id_fkey;
       hospital          postgres    false    228    225    3535            �           2606    16650    room_detail room_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.room_detail
    ADD CONSTRAINT room_type_fk FOREIGN KEY (room_type) REFERENCES hospital.room_type(room_type) NOT VALID;
 D   ALTER TABLE ONLY hospital.room_detail DROP CONSTRAINT room_type_fk;
       hospital          postgres    false    232    231    3549            �           2606    16655 9   provided_healthcare_service treatments_available_did_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hospital.provided_healthcare_service
    ADD CONSTRAINT treatments_available_did_fkey FOREIGN KEY (dept_no) REFERENCES hospital.dept(dept_no) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY hospital.provided_healthcare_service DROP CONSTRAINT treatments_available_did_fkey;
       hospital          postgres    false    230    215    3515            �   �   x�M���0��S���j7���˦llؒm9���$���7;�᪵툃Wȝz$ob=ë��p����+I��t�������Wq��Jx�lT�<-���!-G��qK�8A53���3���_��h֛|���Ρᵐ`܈�Y�t�f4�`?�Zm20��*�"&�_�f�V[��_�,�>-]t      �   1  x�uV�n�6]���?�BԓZ&N���,�$��n���J�@Ii��=�mɖS�H��pg��Xp���N*	�8�5Ҍ�HIdt�����jأ�#����t��JN��G%���n'+�7����Z�zv�%#!��
�OUL8+'��,!���*�j2׏r���QA����r��oUOi�s��=�^�z�CT	�~��ii�F�Z���(�=l���j7�"ǔ	z뵑-�X�0������gNEIo0��,��Nvr��)���'\~KO^x�z���{���@y��r�!'����s�Rz��N������l��ӂ����T�Q\R�c��1xT�(��k��Vv��D�{��0�9bS��rm�P�?�N�I�sJ��U�6�%�e��� �Q[�����E���V9�kF�}땪w�N��=��<�)��U�vr�nϞ|l�PAiB��C�[II��%灆�6����6[H+JL�R;f?��C�ObB>�r�m� N�����V�=Ĩ"�V�5(�!��C�I��-��7����QF�{�ء������٪/�F��𿤒6N߇�!���ڌ�=��T�z���F���C��VOc��3���r ]㦎���@�4���%;q걇�/�9�f�s���.`򬆃ɀ�
�C��Ԇ5G�����
��̐��V|U���t�4i����v��!�L&��T��S7F�z�P�<�x�xJ\����� IQ��EN������c�g%��F�'�|�|;�P�d=�8*R.�P�ˁ���C>��g�O��}D���g���.�Qy�;�%;�W���n�+�Y��f8�Mp�.�	��Zdaޟ��F,�~����0��T��8W�+J'%VLuF`�x�o���jn�)a.�jPf�w����}�F����e~ x����>$��e(w���a;��e��t�_����Ā�毻۝�w.ǎϊux�D(�w�C2W�P��][�F���4��-A�N���}�Kc;5zC������;Q���~Z�F/�S�9���q6������U>���t!|��
�c��O�ʟ���=��� �0�       �      x������ � �      �     x�uԻN�@��z�0hgfg/tHAA"�Xi����bV�`~Ʌ}��i�cK�������4��l���0��rG�Qp��)�p
8��㇓m幯��S��p�N������tpF���8����r�v��)Bi@	QB��D)QJ�eDQ��BT!ʉr���5�����������шjD5�:Q��N� j5���f�f�%D	QJ��DQF�U�Z�AT?����D9Q��Y U�����F�}@u�h�:�@��2P����Ӷm߳���      �   �  x���Qn#7D��8Iϐ�!r���9"[��Ҫ���@��뱌z6���m}ޏ�{����������|�e<3޷_�=���Z����%>�^��v�>�82���=���8s�|���<>J�9s���x��m^�����ێ
��w��8ݼ��|����ق�l�A����#w�;�y�m�`�A�z;����o���ϭ�8EQ4@p����O�>J7������+n�ȷ^��^��-8϶�γm;���vJ�ٶ�&mx�����������Q{�o�-8�h������ٛ.8϶7]��m_��v�M��-8϶7]p�mo�`�����v�A�S"8϶7��&7=�K�{_p:Z�{_p��h��<۶Dp��EK��Z���-�v���V��<۶D�Sra���:vJ�ٶ%�-�Dp��h��t��%�S,EK�ٶ%��M-Z"8�Ԣ%gn�`�D��-8϶J�ٶ%���ۖv�A�S"8϶-9o�%�S,EK��-�b)Z"8϶-�nj���-��%���n��<�*�gۖvJ.l["�]�N��<۶d�bK�X��NG+Z"8�R�Dp�m["8�Ԣ%��M-Z�rK;%��l�y�U"8϶-�\ضD�����y�mɺŖN�-��V�Dp��h��<۶Dp��EK��Z�d_��"��"�M������"��"8�n.�9�D����O��W��t�����N~��N��G���<����.����Wυ��/�r��nw$������+�+�0��w�N�p�"nWd���P8��O�)�1��U����^)���R�m����[�Ky��U�d�l�'ܞO��'ܞO��p>�O8���n�����~	����|�/Yh��U���%n���%<�S�K�ؐ��p���uq�/�t��	��n�	���7����}��[����_­?�0��K���|U���|�~����~	��T��}9���%��~]��Kv��|����[���d������|�/�֟��a��p�O8����%}<_�/�1��_�����_�c>U�dK��~	���_���M�=�p{>�֟p{>�����?�0��K��'���%���}�d��W�Kx̧ꗬ�a���O�/��C>�_�a����}�� {>��|­?��|� ����}��[� ���n�	���_��@<_�/�1��_�� �����%o@>�_�a����}�������~޳����g��������w���'r��i��|���L�3��?�L�3��?�L�3��?�,���?�,���?�,���?�,���?�l���?�l���?�l𳳟~�~�;?����[?�a����[?�!�G9�w~�{?�4���O?�4���O?�4���O?�t���O?�t���O?�t���O?�t�3�� ?��3�� ?��3�� ?��3��&����ϗ�"���'|�y��9�����p%��������W�����B�����'�?!�	�O�B������ ��/�A��_����� ��o�C��ߐ���7�!��o�C���9�?ϿE����w�������_9���?�����E��]����m����� ��7ȿA��o����� ��wȿC�����;��!��wȿC�������? ���@�������? ���}�v��_����_�����������_����|��{����s����� ?�9��~�s����� ?'�9���������m>'����r��?�?Tn�L�3�����M��C�6�	~`�������ʭ�~����r{�~`������[?���P�����?�?TnϷ����|6����r�g��*w~�=�Q���?T��'���?T��Q��Ώr�o�(��y�6E�o��E�/��7��_F����������u���������u�� ?�9��~�s����� ?�9��~N��)������)������)�O~������?���Jy|�����Jy|�����J9䓟�+?�L��췔����췔����췔C>������?���Ky|�����Ky|�����K9䓟�+?���gܳ��1�����3`?�<>�~�ǔC>������Q�����������j      �      x�m{ٲG��s�+�l�}yT5���j9%������=#��w�L�l�J��u '�>��F��>_��xͻ�Ze>����|~<���uE�"I�"�LM"F�������sf~l3���#Ϊ3>ђr�lTee64ׂ×9��m�������G�,k1Z����D���Ǫ���G�mXD��{#�~"��`������+��"#��qi��b�KIm�6��������ጾ�e��"9��OL����/8�2ZH	#����D4R�1U\%�}�Kᝄ;0��,�X��c����e�ܮ��8qWnC�a�����=��T�ݣ'�F܀����#�A0dB���[�U�:�{�O�|b*�;�i����ޖR9����'fюuv~I�z���-ܙ��8�3��Y����P���j��24E���7��ZG��,j<��پ�x" ��cJK�
����񷓟�s 6x{�!b�Y�[V����Y�,�Gp;X�0b#)�*`��D=��n��ї�i���n���L3�����	���8h���_1�GUW��5����r9�(?S��=���v����m�k�����1�8���	�FzO��������6f5~�: ��� + @qJ����:�Mx���k���Jqw5m>/��\)8�"��4����a��9ʿ��i"L����@��%���ڻ���#y�π?��9�"��'��m�0CьF¹��(�ih88�����(�0�;��)��4�!�EF)�\�ߦxl�?��? u�op�e<ȹ��p7��i.!�)�U.�ݵ��u���-��&G�{�(��e���"BAؙ��8�[<��s���2��IF`�)��M���� J�6�'� A�áθ��D�a��{�|O�Q�z6�G"�BP����:�f�.9h�lp�諭Vk5U���(̹�Xy��pI���ï�����.�l��ݧ;�2�I�㲯�ȥ��^< �
�FJ��9X8{*��:��m�eȸ��C�� �����RI>�3�J �r���xY��\K_9Pʐ�;�U���xk}��d5g�� N���-X�h��̧�׸A��D�JC����<gҦ�2�p¿c�	�LQ��
0����<�`<�ŀ�؁�M���Ʒ^]V�gs�xs #-���W��Rt��@����,����d�ߚ�y���!B%�62�����*x��P�r���"#�:혜��]�ڶ���Fn,ügV���O:{A�T[R��$9�lsb!�h��<٫�9u�-ȶ�@����Z[����"�w�e@�_Ǫ�}�xVb�T%y�y�v�^��@8d��e�p���!Wƪ^�������Tm��M��}o:��|�=��+͕�!��'˷�����d �!�8�c!�5o�������Ea�|ᏺl���[8^���'q�gk����t�p�:���!uq(�a�����}����{�.���>1p�F�\U��3y(;�(0��H@�������+?�,s���q�U�6�R���l��z��y��C@���$J��u�
���+�7��DW�h~\��#UG?�W���K$A#�}��� �+w�� ]Q,*̗��bM�����Ǉl<�|"�����/>����H�u�?��Z�~�F�#x�d<[;[>��]�
��l#GA�3�u�7*K���Z��5�E7.�$����E^�C:k����r	�-�w�E(0[�{����݉(K�z�����
>8ޑ@�*Г�P�L�v��|>y�۶P���� 7XT.#�ڹXmr�= �<����O_H��p{����gd�'�RUͫd��Cz�f���}I�Z#�MN#����K�n��<��G���Y\=�E��42R(n< _�K�P��jC�V�eh�D�GI�.u�7P���7����
K�}�m����-U���4\8i�|}�ІqW$q�Tlg��A���¾/J�[^�7vPME�9�l����Z/m1��X8���zWB'�$y��/Hi(P�ZF���*�4k�c�4�H��ڱ2��*U�@K����>�T��*��f�L�֔��rͩ��*8R9hia_7&�3�h��z���奥H�٦�}�Ja�f�\�VRJ_�ړ$;�����_PͲ���^բ[��r5�"c@Q@�4�]�C�+���y�ŇA1���>��հ$s\�NI	`�+4���bx���^� :�U�=҅�Gu6�+������ņ�AIF���<0�9t(ѡe���Q�Ǻ���k-�cK�%]� U�Hk &	j������?���z���T�N,��<�b��˰/�� A��ԼK�<�8c_����܀�w5�u��))6�@`3��tr�?����6i���c7Yy%��x`�*~^�kd�j"��-�Z(�ʫ[2_�7��C�p��� �HdL���%�*�iL�[;�"��R�j�(�*��X��k=G0�l`��Q��m��B'n� B�e��."���KAy�_}�E�0�_���������� �@��A�sFm�X��=�)�+�j�"��#%�ܤ=V~<��y<�ܡZ*T�Rq�?�Z�D����x�@�
瓎jH��ARs�Ħ�ը�)�Z+TW��	�"��ħ�WHw�0I�A��F.;��^lqz)�D��fʖ��C�S��
̀��v�X��!�.2^E�ڝ��|�b!�@��
��J��k�����8Nq	'�%e6�cǞ�y� ��.����l�Z\�S�G\�4̐pէ`��Uqd��8�����P�x�,'>�?M��ύo�E3������BGk��<Ӌ�k_�~"�9A9�nН�i�R"�a��_���2�߳8G�ց�.��)5�8�0@�E3�w�Q�������d}W����v^�)�Al����d��q,T.^m=q�f���o�]�(6�[��Hǩ���g�C����BzP��-}����@V�Xv��ZdTʭ��!gM�ahOq���� ��t���c�;��g��_13~ĥ��AhX�A�S����o��*�!����6wP|~�Ù�؈����IK2�J�%z�h�u�H?�"w���>hu�<���*��U��h�GeA�����WjAD����kD��(7���轚`�暮���QQ��G�Cp�,˩���4KtH�
{��Mu����I�I9j;^]�>1PH�8\�"Nx�}�|v�ܘt�n��
LiQ�y��I�.��+E��$�rIM|Is$a|�|U]�������٪X��\k�ǭ�0�D����s]��lC'�?"|���5�D������i-q������:�PRL_#��q����KCz�=#y�T=���᠙Cu�	�&���ֱ���?�=F!����#�NQ�T�ñ�e'{5N�E���x���)��?��G���=̜D��Ϯ��y�=<��C"¡,[���9k���\n�3 ���=��a,<���>j��4��m���&�/)❂FE?�����D�w�ʕ (�ɪ��$y���w7���ܐ)T{P�0SAsڙ�[�t㈇,�E��ԑL�$���Y�S�_����AxA�	Cnv;�8�8������~��Cd���b�>O�ո)<p��z����B��?~ 9�������Ԓ�ͫ��1�V�ui�i^^5N��b���%�h "p������(�fdL�q#�,�����T�y� 9��ޡ�Y�΢K���C�+�n���Ӝ�fOj�a�j����6��2g;*���ɓ'[���1h8�s��T]
&����AJa\I��v�-��5��_�x�i����ת���:[��&V����	g��i��?�1$ 6^m���f��ڗ�h$,�m@�\����>�m��ٰv�&�-a�G���ڦ�X�TL1��u(6��p�ꈹd�*���:H��~ mC�x>RV�8[x2e\�	��+�Aq�ó���~��w(Oe<t�̡5^�ب~���yE�K=%]���83r�nfNĻ m a
  ���PAPn{��*A��Rq�<:QvrÄf�mP�K�=f���ك����?Ʀݲ��O���N�xL�	�$S�_�}*�ͯ ���G��/��`/�����x��݉n�Ԫ�*�ģ�o���h�/1�����N�
�4&����f)�vO*c� )�O�z'^+K��}B�]Ai��i�����s�k ~�₳H�+�+�^��tC��,��1o�x}-\ �Lq�s�=d�ɶ�Նc@j�7Ykp��͂����h�{`�;s;siH2�� ."IW�#拄��(�����חΠϕ�.�7+��f�ڬ\u5�	$���u�A��)��^�T���x�g܅1����J|�$�;Jq(��̜2(}y�7�4 �Y��j��=��b	�4[��D���v	
xEԠm{��Wa���p�/�\�'��ט%3������hh�@�0嗡����eb�m����7���J�:Y&�e*mw�KL�[Zn �.���>ahH�$���Y"B\G�X��m�<�kY��N�B�Krk:��o�F߁ǾV�R%P�_2B��p�4Vq�<���;q�z���e6�_1܃^
�F���é�[��_g�h6<ˬ"��Ô�ŠIm!�qM|�F�D�dK��}}�A3}�v�nO����U���z�kuqTN�U�ܨ�����,�VՀa����{�����5=NHg���+�S�w���@��~Qr_^:��/���?0�)"Q<>��(}�TwV�	� ݹ� H����@ha)��9���cA�~�>�],B�E]��ӣ ���ր�.U�
H�j�Gu�%�{;b�dHD���1䂚n]Ou�w1(�"�BY��~/KÎ���#r�!�G�*���I�u����C#��J2�� u�	{�_�R�izs��Ӕ�����5��v��
4���ٚ�2B*���/s����GW�E�b�����R7�D]oI���)�+��Ϻ�]�2{*݊�sVu���h�zjS^��Z�$��-���}e�a��/m��B�� Wn�N�lMU�\g=�S��|��M���B�F�>�s5C]�#�^{0�� �}��,Y������KY�@CWI�����O�J�+>6��Z����>NP��<��X� �����T���PJ�n�|�;���o(�~T�=�.H�w܇i���Ϫ,�o�1���g�E׽W�7z�f��+_âIݝ�2�y��f|�:�cZ����Q{*�i�H�j���ߡ1>|*j%I)�ye6� m-p(�E� ��V=*�[h�����q�zA��g��z���앥�{�e$D��x����74�󿣽��c�l5zp7�e���M̂�\lAJh�\��U^H��>�x���}{��ܚ@�pJU� �l��0�Tg�vܚ��H��؈�n���������s،h&��~m4�n�L�:U�A���WX��&�ݭҰׇ2�����֜E�j�\�E��uE�G��pÍ�(Л�[�����~��$��l���'(��vnǙѡKSR� 4�;�i��߿��a���v������t�%c}��q'b��TC��c�*+�����p���	�{xf�P�S��G5��S�&��	t�k�U�����i��E��:Z�7���)rK;S΢v�:Ӗ+,\�X��<����3s��[Z�a
L�3��/U2U�:�y���y��r����ޛ����	��}��xs/����}G�1[���y��[��7!>����<����N���Gޫ�G��y�e���G_ZA���^�ӟ�,����*���LK�P����{k�e�S��=s�v/�4n�M^�87�DQ	�ã��"!���VoV6k1���[��������o؏�}Q���[Cj+��~��n�Z�TߐĔ�A�a��r�!���Y����!�����v0`�L�c���1���؜�Ňv�18�yed�aa����p������!��O6��b��4��A�糝]bB]�NC��,�'d��>��D�2w��.q;�a~<�̜m�to7>/�y��^��꯯m~ݖ%�s-����٧͒��CVN $`�ܓ�׆���)�Z���W��@��ul-��/s�6�8��¤��~�҄���{�=][�/O���T���ͥև�n��w�6������>��U�!�!O�(�@�p$�6���=
�t�c���ò�s��9�U���N�e�S�QO�<�mĦI�]HJ!��.�#�[BX�.~]_[Nаi-��8�p�%�}�T%0�Q�^���RC�'���w�8���Xִc��N���s�1��n��@�}�-C�����!��G6��w�S�<�f�P�v��������ڽ^�ߏx�x�� �:>������ǆm3kɕt�`k�Ox� �!ؕP�&Z���N��	lM``�:.C�6����ųk�4t8( ���>���R�ڇ�~�h��gtk�c�;y�f�;J T,�{L�b_�_��{�g�/h�M����?��%!1춙��[J���9�Bυ�	�$����hy^�2u�)���괾������A�YR1Pڻ����M�o��\l��f?�ck�{f��]E+�����0Y�M��&�&G����c��v� ��5�"���;7��|����e�      �   �   x�MͻqA�@[�l��6�i��`^����9�s�rmhS[�֎v���}��ZZKki-�������F�Hi#m����6�F�H[i+m�����������v����hM��Ц��Ү�+�J�ox�>�o����\�kp��5���\��p��u���:\��pn��7�܀pn�M�	7�&܄�pn�M�	��܂[pn�-���ܖ��z��=�̴      �   �  x�]�K��6���0)����.��92T����_�R�ej�{�����_?���P�?�O	rH�:*H�C��b�,�ׅ�{��T� C���='�9qω{.\�p��u���g��.�SA�u��.w9��ɻ�����|*H���d�� A��Ђ6t����܄*H���&��2���,�ga<�Y����O	2���ԏ�P�p�?�� A����� �n�ݟ
�O㹩�)�d�3y��\�"E�lr&��:�"E�줲�.�i��o�;X�H�M��M�,R��&'��7�5�E�4��L�7@+X�H���/���"E���a��t�� ���{?v�э����E�4���Z���}S�`�"Mv��8(X�H���oʨ`�"Mv��`�"Mv�_��p%�i�ə�TsY�H�M�䍷�E�4���#X�H�M��ͳ�E�t��T�H�&;���H�&;y�=G�H�&;�6� A�:4�5�5�5�us�B	2ԡ��E�4��Lތw�H�ꆺ�`�"Mv�G�H�NbAyY�H�MΤЎ�QB;JhG�+Y�H��|S|�E�4��$��7�k�����Y�"E:�ѻ��]m��6zW��w�*H�|�<�`�"M69ɕ�7ԛ����z�;�,|c]�ƺ��u���7��ⴲ8�,N+�����}J�"E���}����;�<�"E��䍵W�H�&;�1xc$��H����#�7F�_��}�	)�d�A��A��A��A��A������X#X��l�f�7�����o��[��j��N�"E��dc�؍�a7ֆ�X��s� A���
)�ɍ�7f�ޘ�zcꍕPߴV�}�:�����O�H�Nb��H�NV�q�r���cܬ�f�7��N!�S��r;�ۧ�E�t�M3X�H'o�:Y�H'�k1�k1�k1�k17��sc�>7���f��`�"Mvp���'X�H��|��,R���5�*��Wa��
k�uc6��/����_vҘ˗1�/c._�\�n����ޝ�)�ɛ�^�"E:�.�B)�~U�'\Y���ni�`�"���>�㵔 ��P�`�"MvR���8PdN��x�E�t�]�`�"�|���"E:�Pm�j3T���\�l�g6�3�U�Ye�U�Ye�U����	)�d'�]�
�d��N��N��N��΍Y��l9X��8�G���w�Е,2����;X��7�q(�dܼX�B�=�s�s8���s~�n�,Rd�)��������3�      �   j  x�uԽN1�z�)�#���u����AQ'�	%��Y#���n;şg�. !d�����>�oWw��͓��8��i>������ş���u���G:�O���枞���q�{��>V�/WА��"��i�NC`�|�K�#���s��sC%����C�[r��X�
b���s]%��T���H��b@RXrv�Xr�d�"!,�V����UA< � m��0!�KY��-��]�of�kW"��wn�
r3U�4ė,9Z}�Vy�E�����b1ڒVi��,"T�%��*��j��c�lF�X�1{�:����˨X�z�6��6\�?-�Wu钏��hZ_�qM�K��Y�S�f�^�ι��S#      �   S   x�Eͱ�0��A���66��0�f�㜙-3��ְ�uY���m)� �xD$&}U�����Y	v8��l�Vl��ٞ/�U3O      �     x�]Y�r�8|F��?�)������$vⵦ�U[�I��E�(Ҏ����Hy�R~H�\�t�A��]8�����}�ؕ��0^iw��7���Y�e��v�wM���u`���$�����e߆�m:��8��/�Dɮ��Oa����?�^b�)��|�����n���K`��2B��U���}�LK�Uq�c��kݤÚ=�#{�]_�ǘ�.��L�e�:_I���*��u� ]6�Bx}���� ���J�J1.$��V��޷)c˖���C�z�WK�b�"_G!pS���]���1�������ɯV��u�B��E�"v�aB���~ʵb�}ۆ����5�M��)�)Y��BVw��j�x�ݞ#��жu`��mc��ƙ�"��/�R�W<�n��m_<E�I�9���= ��.�5�R ¨��c�BHV:��嫧��N�����{ nh6/uh6��S@���+���b��Mh�67q��t�d����G�|���6������� Ġ����l�;*?UA���%*l1 I	1�$��j��+��)ኟ~_|���4�YN��x<��R���,40Tq)Mq���pL�F�
þET�=��v�9v#)��@�S"�uY|���x���Q=5��>��	z�r�#�i�0�7��&�c*|�	qh{�aOR��Ȃ�i�-h9���m���e���FXAcc�!hYr�*w��o�R�j�;ο�ա�X��
��&O������>��	]w�9Gp���d5�ށ�H�rh�O�����)�fV�;���sn>�9��cׅLz�,�$W\	fJ������?���`��15�Dk��PJf9Gۺ���q7�P(��o�~�]X�=(�t�b�6� 0*\�C���^���v���8<�ux�D�yV�� ~ƣ��w
 �XA@|$�u�� ��t�b���e�u���gԫ���e_��	�|}�!��\.��_�C)-���&t�y���x�%6��>)�V��#I�ҥb�_����ᨥ"�5�JF���eJ�H�� >���S~�$^%����`��TC-���� s|��l�&����CIz�یec�L�D	�7�E�J���r�_
��l�T�_}.�B�����PH�,5X�=��$%������fNg�� j���fa��Űq ��c�M|YM!V.�v�d���_������6��,�Nkv�&��t�6T &9�	�h�.Q�RB��/���` ���$lu��uT�*8��*�ӌ�cC��1�~��{�O�b�8�A�BK���:N�J�� �+vP�ElÎ�6Ѳ"J��<e�4w��H��W!�����n�"I@���T�r��AbJ&Q?�*��K�ƞ"�W>%����І��b������FJ�@��l����5�i%�W���1\�z���1��1�oMi���$�3�8/���m���$����E���K0Kf�=/9(�_ I�iL�bw >�A�����k �%)U���ݟS�� �|��f���ra5�����|l��_C�!�)�$��iþ4�ѯ��ІM�N�X+�Y5���+H���6�x�9��MA�����Цê��v��A�@q�fv�7] 
���\Сr�o߄��o:�n )�@p7���S�I�.<��H_��
�v4&�<�K���8��1eL�r�?>�%�@z��Ӱ-ni���g����bH�'8��bi��E�n}32�QbDE�e[�A�ЄKNY?væ96(d"]%u�f}�h�0��R��7H��	ٔӋ�.$��OA8^�8�x�vޠ��@�A!��h�s|O� [3�V�8t���l��d�,�'�f��}��<&M��	Oi�@�as,pB��g��Dj_Wo������HEy��Az4�k��UM�l����q������:3��$�Z��Ģ�M�t����r��$)ڱ����S��0Bt���ӎ�pV��n�ȱ�Ԑr\2N�F�y����Z���y`c�(֐eMbz��n�r�ԅ%*����c�;�M�̨3�+��[J����U(cw�!o��g
�c��$ �����f�l��������N:����a8��zyL,�8QP�����X��rh��3;\�����	���s�i�N��8Q,���.�kh )@˞cC�$ɟM[)��T�&������e��佌%\^ʁ[32�X?������G]�o�痿�C�;�Ŏ���W�bG�Z�9�Yƌ�q0ݓ�۰M�wb��ƅ�S�
x?k,wbo�a�����P�t����|L[�@�,g����b%K��l�"@��Υ���qL "����?K���� Fn����$)E�ݨc"�&Ц�@�K@�8{h�'����v��:���
�rg����6��0\�5-���-�H[U�y 1wتJ!�m�0
0i��-tG�~�)��Sg�uB�L�b߉2&B��m�6j�����S����'4V����}Þwu��=��i�B�r2�4մ�WޮRF��������4������$%`�� <�s�(�L%�;Mf���d?�O>PK53P�1�9+{C�o.pP�
o�oVI���?�������� ��d���P7�i|W-HΜ,6
��s�8���K��箛MG��y0N]*��y)�� f�sA������Do-ֲ��U�4H���5��;�P_X*�s�P�����a� A;��r��̅RãX����n��� �C��v��.1*h�A:!����t�f_6�=��>�ŸM@���K�B�{��T��8�u�l-�d��,�B�U�b�� ���M��M"�������X�Ϋu��#��8D+I�X�l#(��#5r�oYL+���m-l��`�^+��p���IǸ1�BQ��9���JM<2�0��^Z�؏��*��/\�ⰴKx��g��z��Ԅ6�>��u�eʒ��������ދ�b_1|�g���MY#x�`�+~�|�F�-?{>Ms~���_N{pY�]�Ġ�jBh���qE�9o4��*<��
 ������4��zH�ڿ��0W}����+Ĵdس������L"�u��f��x��Ð�k)���*���t���w1\����3XR�^)�����BJ*+�@��u�İr���Uz���IM�v|U�RF�ĚI0�cD���*�$���[8�u8�wu~���,f��F
�����l$/K�=v�����-�u,��)�!��v"[?��N8O g��U�b&�
;�w�BX�a/,���2Ի�Іw�[��k[��X�ç������ ��w�      �   �  x�mW͎�7<�ߥW��Ɯ3�*����9���#�ʭ�ԇ����x�4J���g�g̀%���sy�������g����r���Ӄߢ4��^�ˌ���0RI���N���,px���hY�>s���~���b���<�E!�М4�[_{||��Z�z�
}��1��Ck���K$������Ӄ��\�V�%�0�;��/���t֕l5,�0��
������-�^�&n�9�X������D.�L����؋1a��2y�d�65��O�R�|
�L;��VK9i��:4�7�vʉ�^j�.v��l}m}f�#ؒ%��X��ء�{tz��U�gW�_�<�b����j>�-��#w� �䷮mjb�Ђ����R�-��X��h|i@q~͹!PA �>�_��|#�e�o���x>i�[�%l�\�nM��-��h�R+J�[U�\Jbw!+�C���T�A�b����}a�{��]���~m�p!��z6)iY.<Oɴ˾;O��E; �k���Kȷjjp	�����U��Ҁ��kE��ie�\��w��Q��˗�k`�m�.z��m�N�}k|�d�w�/�$�o?�aC��z�
�p8�&��fGI}����J�������T8���m�o��IŤ�(S��\�	�)S�/+�ҵ���Px��;�v/�i�v�e�4`vM���n\͗%���ڝ��|7��9_SB��б/�)�k�k�`W�IW�E���t���R�B�.���6�6��ՇLވr�K����K06l��o�����Żf�� �����\�þ{��*|�ߦ���(N�iwdؑ��t��}$�5<T���՛ٴ��FS�@��˷��ÆAoo�`�H�Fѽ��.5�[���E�}t��@�z��0�RhR;b.��t��]��T�0����Xc����k�����$�6��Æ��(§�����o;�Ҷ7����nwz�<��&a��s�zŮ6�;�8�6������$W�)��Me������إ�]�e�1B��L�XD�%^{�E�����=���� ^���0�]��i��b���-��۶W@r�3-8�x�[l
;r�x�/���@o�鵷Z��Ѐk�ZⵡW��R/{ņ���o;}j�i!`�מl�����a��TgXpϺ2�2�p�q6��7۶w@V��l�\��Y�������g      �   -  x�MRIr�@;�Ǥؗ����=�L�6!��T�"y��3���]A����k�C)���bv/���8�}xh>Xx�IHr���u��H3�|�[SBH�zجj���锵��3������6R��VJ�]E�e�<f4o�xo���z7� �>~�������7�����}�$�;ڴ��!e�ю�]�W!�wٿᛎ��O�#����i�`�-z¾��8�F�ͭ���KY?{~R��w������Kr�VGX
�T@T�`���pZ3�k��G7&�	�Oyz���d0?xpa~~����褴      �   '  x�uV�r�0<�W�RH=ι�l�o�`V6�b�-�N9_���� un���y�����:��)����aY��P���簆E��?�aLSX�0���)��5ݮ���=Rɦt/%��������Z��2��͐8q�<����s���\k��^)��x
�pŚ�tk
�[�Z��m����i��[6���zc#.ײ������ ^�8}:���ޮ�J����q�k$SC�%�����U����PT�^��	gε*�%�p���a��m�ï�׺���R	�X`[�ȰX0b���I����ұ�>WN����$��.s�-<�3;���Y������⸖=�>Q���ؒ>�h��j�se
"6>s��ٰn�.7��E0�t�3?�2�>�R-[+a��߲Wؖ�����n�sl����-0:�_��Glو]Ks���w��K�W8ǚ���[���l]k��0T����wK��y�7wk6ܳ�{�<���N�i�ܯ�=�!M���a�b�Y:�x�O9���@#�O���a�o����V��_�WXn      �   �  x���Mk�@��ɯ�C�Idfv����(��z	m@i�#���X(�V���0/��;k�&D�&�l+���Ĭ~ߕ�8�MY�Ub���Cv�  ��i����1��)?=CC֨�$ug�e���t������-�ϫb1��"bD�m�$���h[6�N/�%r��b`.9N��C��8c�%�	!8��Qa��oˏ+s�9���Rz�V���h�.�TtO2T��T��p�A������TW��t�I�a8�V'�q���ړ�e���6M8kL�	���qi	�1A��K�,������m��J�|��z�	S[�"��OFB�>c�ٱӔ*"�E��O=�����9�o~�v���d�0%<��A>c�Gޥ�_B/R��+|��u���7զ�      �   �  x���Ms�:����`q3U=w�t��Yb��i0"�r��(X1���jϯ�W�؈����+ztt8:�<�ԚY�R���JZ7o]�Em�q�����ϻ;���`�Y�Vp�I�L���h��Xb��⵽����l�|�=c-���n
�a���C�弖��gov��U���=��6�p���4K�u,`T�v�>p���|~0�M�I��nh���(�ʰ	���fI���{�3�7��b=�9��/&�)��X_-gW�7-�0cӚ��l85c�Ƒ:b;�Ӳ<ڼ�u9�ٹ�jؾ���1���+Q�Vh���~�--��{�z	�c��c��ϗ�l�`%;
�wX2
b���(q��g�e��g���Vۼ�K���c5e}�%��/w��>��^l=X����%�cֈCA����_�D��m33���aW�Ifg�f�����X+�~��E�.$c�g��6�=�
|��aOYsu39a B�]��X^���'�s䝋N^��4ޓm#�ȎՁ�`�"��K��\�� �m�rXme����tr���If'���sU?��d�pU�亡4H�- Y��\�O��yJ�D1s)�.��!	�����("���s��dey+*��tR}�n�� �(E}Y�L�7k����u���5��#y¤���7��{'���P�6��(�����}��I���Im���%C%��'������'�lIk�=���J:�	t��8����yB"��=G#n>@A�ud�;�������w����F7�����O%Ix�����!�x~h=Z.k("S�;V*'?�v&�V��<)z(T
N�F��G�8��8n��ǒ�[}%�������+�FnEGػ��q�H��'�v��HC�d�-/X9`_l��P�:NS��\?��Wq�C&�Ր9ߧ�gy�6t����������Kh}G��}��U��J��|j5�I�	h�����X��g�9��=I�Y-Є���� �� s!q�j~T�z�`��}ܳ�����r�,}lT��i�x�$S�/z�<�����\7����):�.��T����b�����a�3�K�׮����xY����_|W�c��:}��;�׷�d%L����#O{�Ms6=#�>^��?�,�R�,��,ZH=�u��F�e�����U2Kd��t�593� Q);ؤ�vz}��>�ԥ�v������o��|J1rG��'ɼ?�WW"�ic���'ȁ#���
ɵ�T�-*-�f���0���N�L٫�ɑ���T�.zG]��ב0�n��U[r��E\O��i�z�7!)D��{�D8�.��L����P%Ӡ�/��U��M@�r+�I�o:��])�㽕�xT�^MID�&O�OZ�����gg й��q��x��<��?|�DC$����
"�\<�P��oV�9C�����t�*:�^U��M�A�4�R��#�lEԛj�G�xCw�M�1�0�G�A?����Tո��vj�n���=������������|o�׋�qO'̕�o�	�z)���x�<U��*�����Mm���Ʌ~%��tL2]0�Vi ��.L%�8�-�z��$��d��X��������kx*�G͘R�N�U2�?L�ɽn��#��0�l'=���vW������J
�	%3��n�������\E�D�~M4W���W������?r�
I�HP����/ו��9�Җ������Z��ˀ.Kک��4���LY�~�q|��OR��38Q\!��I�����`��H݋��W�)`��ʷm8{�7�6+��{��w�^���&�pt������P%�����+��� $�C^��͟I�NP�+���`�"����ʂu�U)�S�xILz���F�h��d�ؕ�za�Poe���Qݐ���o��CK��������lh�kn���\���(Y[5ڎ/�醗3��đZڈ����q����im���3����O������      �   �   x�U�M
!F��0%���tS]����ϟ�ڕ<�<��WfM�ғΏJ)2�Cz0Pĝ\c��ڤ�{���EÔʚLQ/�,�Y��3k�`������j����$�������.SȂQ��dnJQf���U0����@�|��U��QV��-,��5����|(���2IZ      �   y   x�U��
�0���S䐣��'�2^B;�B�)�M��-�^�of�����:�xN��eF��R&O�c�㿻�c}�O�|ek��FX����gE�����2oo��{"����ܽ�� �2�      �   �  x��W[N1�v���_�p�s0K|$;�V�b���y�]&O��H7���?��r=Q�n�78d�|}n�O~�Uש�W��������J�1�7�[`7��&}]�f/��`<{?:��U���Z�S�t���\b��)?T���/�W;V���Y��ٵ�o���^�&51u�}_�iP�MѲ��մv|y���V�ʹ��tJ�'�~���Z�\�6�b��T����N�K&�1�������<<W/�CECF��z����O���;`������9ʌҬ%�+,|����w�%�ԇ����ss��1�9����dJ�)���>���E��q�M�%��a�y�[�K��i(t�}Jfa�>�tC�p"QN���Qx��g>�+_ɔW{�C�z��ȵGdJ�,��m�l�(�dM���x�������۷up�x��7
����f�()r�'���}3l.u)iD�u�`[�+��J��X���0��p~ɨ�5��ͬĠ<��jq%���&DB]uڳ�F>�p�%��&A�4�ˏc��L��|�8��Ê�$}E���3�@?v�<�f�֔�9�����vW����o�M��7�1F�)_��c�N���l3��o#��}�	X��Qi��]��#�����8��>��78N[�     