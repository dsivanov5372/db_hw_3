CREATE DATABASE ivanov_214;

\c ivanov_214;

CREATE TABLE stations (
    st_num INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE stations_personal (
    person_num INTEGER PRIMARY KEY,
    name VARCHAR(100),
    st_num INTEGER REFERENCES stations(st_num)
);

CREATE TABLE doctors (
    person_num INTEGER PRIMARY KEY REFERENCES stations_personal(person_num),
    area INTEGER,
    rang INTEGER
);

CREATE TABLE caregivers (
    person_num INTEGER PRIMARY KEY REFERENCES stations_personal(person_num),
    qualification VARCHAR(100)
);

CREATE TABLE rooms (
    room_num INTEGER,
    st_num INTEGER REFERENCES stations(st_num),
    num_of_beds INTEGER,
    PRIMARY KEY (room_num, st_num)
);

CREATE TABLE patients (
    patient_num INTEGER PRIMARY KEY,
    name VARCHAR(100),
    disease VARCHAR(50),
    room_num INTEGER REFERENCES rooms(room_num),
    treated_from DATE,
    treated_to DATE
);

CREATE TABLE treats (
    patient_num INTEGER REFERENCES patients(patient_num),
    person_num INTEGER REFERENCES stations_personal(person_num),
    PRIMARY KEY(patient_num, person_num)
);