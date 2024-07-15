/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-pf-select.sql

--Student ID: 34692959
--Student Name: Yuebo Feng


/* Comments for your marker:
Generated a report showing the number of completed appointments involving a dog or a cat for each clinic by the servicing vet.
Produced a report showing which vets charged more than the average for a particular service code across all visits.
*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    c.clinic_id AS CLINICID,
    v.vet_id AS VETID,
    v.vet_givenname || ' ' || v.vet_familyname AS VETNAME,
    CASE WHEN v.vet_id = c.vet_id THEN 'HEAD VET' ELSE NULL END AS ISHEAD,
    at.atype_description AS ANIMALTYPE,
    COUNT(vi.visit_id) AS NUMBERAPPTS,
    TO_CHAR((COUNT(vi.visit_id) * 100.0 / SUM(COUNT(vi.visit_id)) OVER (PARTITION BY c.clinic_id)), '990.0') || '%' AS PERCENTAPPTS
FROM
    visit vi
    JOIN vet v ON vi.vet_id = v.vet_id
    JOIN clinic c ON vi.clinic_id = c.clinic_id
    JOIN animal a ON vi.animal_id = a.animal_id
    JOIN animal_type at ON a.atype_id = at.atype_id
WHERE
    LOWER(at.atype_description) IN ('cat', 'dog')
GROUP BY
    c.clinic_id, v.vet_id, v.vet_givenname, v.vet_familyname, at.atype_description, c.vet_id
ORDER BY
    CLINICID, ISHEAD DESC, VETID, ANIMALTYPE;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    s.service_code AS SERVICE_CODE,
    s.service_desc AS SERVICE_DESC,
    v.vet_id AS VET_ID,
    v.vet_givenname AS VET_GIVENNAME,
    v.vet_familyname AS VET_FAMILYNAME,
    c.clinic_id AS CLINIC_ID,
    c.clinic_name AS CLINIC_NAME,
    vs.visit_id AS VISIT_ID,
    TO_CHAR(vi.visit_date_time, 'DD-Mon-YYYY HH:MI AM') AS VISITDATETIME,
    vs.visit_service_linecost AS VISIT_SERVICE_LINECOST
FROM
    service s
    JOIN visit_service vs ON s.service_code = vs.service_code
    JOIN visit vi ON vs.visit_id = vi.visit_id
    JOIN clinic c ON vi.clinic_id = c.clinic_id
    JOIN vet v ON vi.vet_id = v.vet_id
WHERE
    vs.visit_service_linecost > (
        SELECT AVG(vs2.visit_service_linecost)
        FROM visit_service vs2
        WHERE vs2.service_code = s.service_code
    )
ORDER BY
    CLINIC_ID, VET_ID;