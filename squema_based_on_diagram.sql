CREATE TABLE invoices(
    id SERIAL,
    total_amount DECIMAL(8, 2),
    generated_at TIMESTAMP(0) WITHOUT TIME ZONE,
    payed_at TIMESTAMP(0) WITHOUT TIME ZONE,
    medical_history_id INTEGER
);
CREATE INDEX invoices_medical_history_id_index ON
    invoices(medical_history_id);
ALTER TABLE
    invoices ADD PRIMARY KEY(id);
CREATE TABLE invoice_items(
    id SERIAL,
    unit_price DECIMAL(8, 2),
    quantity INTEGER,
    total_price DECIMAL(8, 2),
    invoice_id INTEGER,
    treatment_id INTEGER
);
CREATE INDEX invoice_items_invoice_id_index ON
    invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id_index ON
    invoice_items(treatment_id);
ALTER TABLE
    invoice_items ADD PRIMARY KEY(id);
CREATE TABLE med_history_treatment(
    medical_history_id INTEGER,
    treatment_id INTEGER
);
CREATE INDEX med_history_treatment_medical_history_id_index ON
    med_history_treatment(medical_history_id);
CREATE INDEX med_history_treatment_treatment_id_index ON
    med_history_treatment(treatment_id);
CREATE TABLE patients(
    id SERIAL,
    name VARCHAR(255),
    date_of_birth DATE
);
ALTER TABLE
    patients ADD PRIMARY KEY(id);
CREATE TABLE medical_histories(
    id SERIAL,
    admitted_at TIMESTAMP(0) WITHOUT TIME ZONE,
    patient_id INTEGER,
    status VARCHAR(255)
);
CREATE INDEX medical_histories_patient_id_index ON
    medical_histories(patient_id);
ALTER TABLE
    medical_histories ADD PRIMARY KEY(id);
CREATE TABLE treatments(
    id SERIAL,
    type VARCHAR(255),
    name VARCHAR(255)
);

ALTER TABLE
    treatments ADD PRIMARY KEY(id);
ALTER TABLE
    invoice_items ADD CONSTRAINT invoice_items_treatment_id_foreign FOREIGN KEY(treatment_id) REFERENCES treatments(id);
ALTER TABLE
    medical_histories ADD CONSTRAINT medical_histories_patient_id_foreign FOREIGN KEY(patient_id) REFERENCES patients(id);
ALTER TABLE
    invoices ADD CONSTRAINT invoices_medical_history_id_foreign FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE
    invoice_items ADD CONSTRAINT invoice_items_invoice_id_foreign FOREIGN KEY(invoice_id) REFERENCES invoices(id);
ALTER TABLE
    med_history_treatment ADD CONSTRAINT med_history_treatment_treatment_id_foreign FOREIGN KEY(treatment_id) REFERENCES treatments(id);
ALTER TABLE
    med_history_treatment ADD CONSTRAINT med_history_treatment_medical_history_id_foreign FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);