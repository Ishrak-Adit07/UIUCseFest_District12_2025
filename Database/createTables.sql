CREATE TABLE users (
    user_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trains (
    train_id VARCHAR(100) PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL
);

CREATE TABLE stations (
    station_id VARCHAR(100) PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    distance_index INT NOT NULL
);

CREATE TABLE schedules (
    schedule_id VARCHAR(100) PRIMARY KEY,
    train_id VARCHAR(100) REFERENCES trains(train_id),
    from_station_id VARCHAR(100) REFERENCES stations(station_id),
    to_station_id VARCHAR(100) REFERENCES stations(station_id),
    date DATE NOT NULL,
    time TIME NOT NULL
);

CREATE TABLE tickets (
    ticket_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(100) REFERENCES users(user_id),
    train_id VARCHAR(100) REFERENCES trains(train_id),
    seat_number VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status SMALLINT NOT NULL
);