CREATE DATABASE ivanov_214;

\c ivanov_214;

CREATE TABLE cities (
    name VARCHAR(100),
    region VARCHAR(100),
    PRIMARY KEY (name, region)
);

CREATE TABLE stations (
    name VARCHAR(100) PRIMARY KEY,
    num_of_tracks INTEGER,
    city_name VARCHAR(100) REFERENCES cities(name) UNIQUE,
    region VARCHAR(100) REFERENCES cities(region) UNIQUE,
);

CREATE TABLE trains (
    train_number INTEGER PRIMARY KEY,
    length INTEGER,
    start_station VARCHAR(100) REFERENCES stations(name),
    end_station VARCHAR(100) REFERENCES stations(name)
);

CREATE TABLE connections (
    from_station VARCHAR(100) REFERENCES stations(name),
    to_station VARCHAR(100) REFERENCES stations(name),
    train_number INTEGER REFERENCES trains(train_number),
    departure TIMESTAMP,
    arraival TIMESTAMP,
    PRIMARY KEY (from_station, to_station)
);