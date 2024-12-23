INSERT INTO
    users (user_id, name, phone_number, password)
VALUES
    ('user1', 'Alice', '1234567890', 'pass1'),
    ('user2', 'Bob', '9876543210', 'pass2'),
    ('user3', 'Charlie', '4567891230', 'pass3'),
    ('user4', 'Diana', '7891234560', 'pass4'),
    ('user5', 'Eve', '3216549870', 'pass5');

INSERT INTO
    trains (train_id, train_name)
VALUES
    ('train1', 'Express A'),
    ('train2', 'Superfast B'),
    ('train3', 'Local C');

INSERT INTO
    stations (station_id, station_name, distance_index)
VALUES
    ('station1', 'Dhaka', 0),
    ('station2', 'Khulna', 10),
    ('station3', 'Rajshahi', 25),
    ('station4', 'Ctg', 40);

INSERT INTO
    schedules (
        schedule_id,
        train_id,
        from_station_id,
        to_station_id,
        date,
        time
    )
VALUES
    (
        'schedule1',
        'train1',
        'station1',
        'station2',
        '2024-12-25',
        '10:00:00'
    ),
    (
        'schedule2',
        'train1',
        'station2',
        'station3',
        '2024-12-25',
        '11:30:00'
    ),
    (
        'schedule3',
        'train2',
        'station3',
        'station4',
        '2024-12-26',
        '15:00:00'
    ),
    (
        'schedule4',
        'train3',
        'station1',
        'station4',
        '2024-12-27',
        '08:00:00'
    );

INSERT INTO
    tickets (
        ticket_id,
        user_id,
        train_id,
        seat_number,
        price,
        status
    )
VALUES
    ('ticket1', 'user1', 'train1', 'A1', 25.50, 1),
    ('ticket2', 'user2', 'train1', 'A2', 25.50, 1),
    ('ticket3', 'user3', 'train2', 'B1', 40.00, 0),
    ('ticket4', 'user4', 'train3', 'C1', 50.00, 1),
    ('ticket5', 'user5', 'train3', 'C2', 50.00, 1);