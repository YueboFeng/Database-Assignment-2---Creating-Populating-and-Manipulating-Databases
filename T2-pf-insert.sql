/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pf-insert.sql

--Student ID: 34692959
--Student Name: Yuebo Feng

/* Comments for your marker:
Added 13 visit entries based on the instruction.
Added 17 visit_service entries.based on the instruction
Added 17 visit_drug entries.based on the instruction
*/

--------------------------------------
--INSERT INTO visit
--------------------------------------
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (1, TO_DATE('11-04-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.5, 50, 1, 1001, 1, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (2, TO_DATE('12-04-2024 12:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 6.5, 50, 2, 1001, 1, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (3, TO_DATE('13-04-2024 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.5, 50, 1, 1001, 1, 1);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (4, TO_DATE('14-04-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 4.5, 50, 3, 1002, 1, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (5, TO_DATE('15-04-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.5, 50, 1, 1001, 1, 1);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (6, TO_DATE('16-04-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.5, 50, 1, 1001, 1, 1);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (7, TO_DATE('17-04-2024 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 6.5, 50, 4, 1002, 2, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (8, TO_DATE('18-05-2024 11:45:14', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 4.5, 50, 5, 1003, 2, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (9, TO_DATE('25-05-2024 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.5, 50, 1, 1001, 1, 1);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (10, TO_DATE('25-05-2024 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 6.5, 50, 4, 1002, 2, 4);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (11, TO_DATE('26-05-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', 5.0, 50, 6, 1003, 3, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (12, TO_DATE('28-06-2024 16:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', NULL, NULL, 7, 1004, 3, NULL);

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (13, TO_DATE('29-06-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 60, 'Regular Check-up', NULL, NULL, 8, 1005, 3, NULL);

COMMIT;

--------------------------------------
--INSERT INTO visit_service
--------------------------------------
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (1, 'S019', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (2, 'S007', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (3, 'S019', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (4, 'S008', 40);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (5, 'S019', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (5, 'S017', 100);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (6, 'S019', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (7, 'S002', 45);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (8, 'S005', 125);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (9, 'S019', 51);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (9, 'S010', 80);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (10, 'S002', 45);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (11, 'S005', 125);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (11, 'S019', 50);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (12, 'S010', 75);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (13, 'S020', NULL);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES (13, 'S019', NULL);

COMMIT;

--------------------------------------
--INSERT INTO visit_drug
--------------------------------------
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (1, 119, 'A Bag of', 'per dietary needs', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (2,  107, 'A Box of', '0.1 mg per kg monthly', 1, 16);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (3, 119, 'A Bag of', 'per dietary needs', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (4,  108, 'A Dozen of', 'apply once monthly', 1, 45);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (5, 119, 'A Bag of', 'per dietary needs', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (5, 117, 'A Bag of', '500 mg daily', 10, 15);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (6, 119, 'A Bag of', 'per dietary needs', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (7,  102, 'A Bag of', 'Routine rabies vaccination', 1, 99.99);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (8,  110, 'A Bag of', 'Once a Day', 1, 30);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (9, 119, 'A Bag of', 'per dietary needs', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (9, 110, 'A bottle of', 'Twice a Day', 10, 10);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (10,  102, 'A Bag of', 'Routine rabies vaccination', 1, 99.99);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (11,  110, 'A Bag of', 'Once a Day', 1, 30);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (11, 105, 'A Bag of', 'Once before the Surgery', 1, 50);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (12,  110, 'A Bag of', 'Once a Day', 1, 30);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (13,  120, 'A Bag of', 'per dietary needs', 1, 80);

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES (13, 119, 'A Bag of', 'per dietary needs', 10, 10);

COMMIT;