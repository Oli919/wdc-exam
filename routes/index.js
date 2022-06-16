var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/dates', function(req, res, next){

  req.pool.getConnection(function(error,connection){
    if(error){
      res.sendStatus(500);
      return;
    }
    let query = "SELECT screening_date FROM Screening;"
    connection.query(query, function(err, rows, fields){
      if(err){
        res.sendStatus(500);
        return;
      }
      res.json(rows);
    });
  });
});

router.get('/movies', function(req, res, next){

  req.pool.getConnection(function(error,connection){
    if(error){
      res.sendStatus(500);
      return;
    }
    let query = "SELECT title FROM Movie;"
    connection.query(query, function(err, rows, fields){
      if(err){
        res.sendStatus(500);
        return;
      }
      res.json(rows);
    });
  });
});

router.get('/availability', function(req, res, next){

  req.pool.getConnection(function(error,connection){
    if(error){
      res.sendStatus(500);
      return;
    }
    let query = "SELECT Movie.title, Seat.row_numb, Seat.seat_numb FROM ((((Reservation INNER JOIN Screening ON Reservation.screening_id = Screening.screening_id) INNER JOIN seat_reserved ON Screening.screening_id = seat_reserved.screening_id) INNER JOIN Seat ON seat_reserved.seat_id = Seat.seat_id) INNER JOIN Movie ON Screening.movie_id = Movie.movie_id) WHERE screening_date = '2022-06-20';"
    connection.query(query, function(err, rows, fields){
      if(err){
        res.sendStatus(500);
        return;
      }
      res.json(rows);
    });
  });
});

module.exports = router;
