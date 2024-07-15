/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pf-json.sql

--Student ID: 34692959
--Student Name: Yuebo Feng


/* Comments for your marker:
Generated a collection of JSON documents representing clinics, their head vets, and all vets based in those clinics.
*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT JSON_OBJECT(
    '_id' VALUE c.clinic_id,
    'name' VALUE c.clinic_name,
    'address' VALUE c.clinic_address,
    'phone' VALUE c.clinic_phone,
    'head_vet' VALUE JSON_OBJECT(
        'id' VALUE head_vet.vet_id,
        'name' VALUE head_vet.vet_givenname || ' ' || head_vet.vet_familyname
    ),
    'num_of_vets' VALUE (SELECT COUNT(*) FROM vet WHERE vet.clinic_id = c.clinic_id),
    'vets' VALUE JSON_ARRAYAGG(
        JSON_OBJECT(
            'id' VALUE v.vet_id,
            'name' VALUE v.vet_givenname || ' ' || v.vet_familyname,
            'specialisation' VALUE NVL(spec_description, 'N/A')
        )
    )
) AS clinic_info
FROM clinic c
JOIN vet v ON c.clinic_id = v.clinic_id
LEFT JOIN specialisation s ON v.spec_id = s.spec_id
JOIN vet head_vet ON c.vet_id = head_vet.vet_id
GROUP BY c.clinic_id, c.clinic_name, c.clinic_address, c.clinic_phone, head_vet.vet_id, head_vet.vet_givenname, head_vet.vet_familyname;
