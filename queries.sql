SELECT Movie.title, Seat.row_numb, Seat.seat_numb FROM ((((Reservation INNER JOIN Screening ON Reservation.screening_id = Screening.screening_id) INNER JOIN seat_reserved ON Screening.screening_id = seat_reserved.screening_id) INNER JOIN Seat ON seat_reserved.seat_id = Seat.seat_id) INNER JOIN Movie ON Screening.movie_id = Movie.movie_id) WHERE screening_date = '2022-06-20';

SELECT * FROM Reservation;

SELECT * FROM Reservation INNER JOIN Screening ON Reservation.screening_id = Screening.screening_id;