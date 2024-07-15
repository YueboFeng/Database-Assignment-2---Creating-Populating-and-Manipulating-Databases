/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pf-dml.sql

--Student ID: 34692959
--Student Name: Yuebo Feng

/* Comments for your marker:
Created a sequence to provide primary key values for visit tables.
Added a visit entry and a visit_service entry based on the booking.
Deleted a visit_service entry, and add another visit_service entry, as well as a visit_drug entry and a visit entry based on the arrangement of the vet.
Deleted the visit entry based on the cancled visit.
*/

/*(a)*/
DROP SEQUENCE visit_sq;
CREATE SEQUENCE visit_sq START WITH 100 INCREMENT BY 10;

/*(b)*/
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (visit_sq.NEXTVAL, TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 30, NULL, NULL, NULL, (SELECT animal_id From animal WHERE animal_name = 'Oreo'), (SELECT vet_id From vet WHERE UPPER(vet_familyname) = 'KOWALSKI' AND vet_givenname = 'Anna'), 3, NULL);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES ((SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo')), 'S001', NULL);

COMMIT;

/*(c)*/
DELETE FROM visit_service WHERE visit_id = (SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo')) AND service_code = 'S001';

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost)
    VALUES ((SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo')), (SELECT service_code FROM service WHERE service_desc = 'Ear Infection Treatment'), (SELECT service_std_cost FROM service WHERE service_desc = 'Ear Infection Treatment'));

INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost)
    VALUES ((SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo')), (SELECT drug_id FROM drug WHERE drug_name = 'Clotrimazole'), 'A Bottle of', NULL, 1, (SELECT drug_std_cost FROM drug WHERE drug_name = 'Clotrimazole'));

INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id)
    VALUES (visit_sq.NEXTVAL, TO_DATE('26-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 30, NULL, NULL, NULL, (SELECT animal_id From animal WHERE animal_name = 'Oreo'), (SELECT vet_id From vet WHERE UPPER(vet_familyname) = 'KOWALSKI' AND vet_givenname = 'Anna'), 3, (SELECT from_visit_id FROM visit WHERE visit_id = (SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo'))));

COMMIT;

/*(d)*/
DELETE FROM visit WHERE from_visit_id = (SELECT from_visit_id FROM visit WHERE visit_id = (SELECT visit_id FROM visit WHERE visit_date_time = TO_DATE('19-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS') AND animal_id = (SELECT animal_id From animal WHERE animal_name = 'Oreo'))) AND visit_date_time = TO_DATE('26-05-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS');

COMMIT;