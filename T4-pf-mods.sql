/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pf-mods.sql

--Student ID: 34692959
--Student Name: Yuebo Feng


/* Comments for your marker:
Added a new column `num_not_std_cost` to the `service` table to track the number of times a service was charged at a non-standard cost.
Created new tables `payment` and `payment_method_type` to support installment payments.
*/

/*(a)*/
ALTER TABLE service ADD (num_not_std_cost NUMBER(3) DEFAULT 0 NOT NULL);

COMMENT ON COLUMN service.num_not_std_cost IS
    'Total number of times each service was provided in a visit where the charge made was lower or higher than the standard cost';

UPDATE service s SET num_not_std_cost = (
    SELECT COUNT(service_code)
    FROM visit_service vs
    WHERE vs.service_code = s.service_code 
    AND vs.visit_service_linecost != (
        SELECT service_std_cost 
        FROM service 
        WHERE service_code = vs.service_code
    )
);

COMMIT;

SELECT * FROM service ORDER BY num_not_std_cost DESC;

DESC service;

/*(b)*/
DROP TABLE payment CASCADE CONSTRAINTS PURGE;

CREATE TABLE payment (
    payment_id NUMBER(5) NOT NULL,
    visit_id NUMBER(5) NOT NULL,
    payment_date_time DATE NOT NULL,
    payment_amount NUMBER(5, 2) NOT NULL,
    pt_id NUMBER(5) NOT NULL
);

COMMENT ON COLUMN payment.payment_id IS
    'Identifier for payment';

COMMENT ON COLUMN payment.visit_id IS
    'Identifier for visit (added surrogate key)';

COMMENT ON COLUMN payment.payment_date_time IS
    'Date and time of payment';

COMMENT ON COLUMN payment.payment_amount IS
    'Amount of payment';

COMMENT ON COLUMN payment.pt_id IS
    'Identifier for payment method (added surrogate key)';

DROP TABLE payment_method_type CASCADE CONSTRAINTS PURGE;

CREATE TABLE payment_method_type (
    pt_id NUMBER(5) NOT NULL,
    pt_name VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN payment_method_type.pt_id IS
    'Identifier for payment method';

COMMENT ON COLUMN payment_method_type.pt_name IS
    'Name of payment method';

ALTER TABLE payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (payment_id);

ALTER TABLE payment
    ADD CONSTRAINT visit_payment_fk FOREIGN KEY (visit_id)
        REFERENCES visit(visit_id);

ALTER TABLE payment_method_type
    ADD CONSTRAINT payment_method_type_pk PRIMARY KEY (pt_id);

ALTER TABLE payment
    ADD CONSTRAINT payment_method_type_payment_fk FOREIGN KEY (pt_id)
        REFERENCES payment_method_type(pt_id);

DROP SEQUENCE payment_seq;
CREATE SEQUENCE payment_seq START WITH 1 INCREMENT BY 1;

INSERT INTO payment_method_type (pt_id, pt_name) VALUES (1, 'Historical');
INSERT INTO payment_method_type (pt_id, pt_name) VALUES (2, 'Card');
INSERT INTO payment_method_type (pt_id, pt_name) VALUES (3, 'Cash');

BEGIN
    FOR v IN (SELECT visit_id, visit_total_cost, visit_date_time FROM VISIT WHERE visit_total_cost IS NOT NULL)
    LOOP
        INSERT INTO payment (payment_id, visit_id, payment_date_time, payment_amount, pt_id)
        VALUES (payment_seq.NEXTVAL, v.visit_id, v.visit_date_time, v.visit_total_cost, 1);
    END LOOP;
END;
/

SELECT * FROM payment;
DESC payment;
DESC payment_method_type;
