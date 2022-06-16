let dates = [];

function getdates() {

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
             dates = JSON.parse(this.responseText);
             //console.log(dates[0]);
            for (let i = 0; i<dates.length; i++){

                let tbod = document.getElementById('dates');
                let newdate = document.createElement("option");
                //console.log(dates[0]);
                newdate.value = dates[i].screening_date;
                newdate.innerHTML= dates[i].screening_date;
                tbod.add(newdate);
                //document.getElementById("posts").appendChild(row);
                }
                getmovies();

            //console.log(names);
        }
    };

    xhttp.open("GET", "/dates", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

let movies = [];

function getmovies() {

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
             movies = JSON.parse(this.responseText);
             //console.log(dates[0]);
            for (let i = 0; i<dates.length; i++){

                let tbo = document.getElementById('movies');
                let newm = document.createElement("option");
                newm.value = movies[i].title;
                newm.innerHTML= movies[i].title;
               // tbo.addEventListener("click", getreservedseats);
                tbo.add(newm);
                //document.getElementById("posts").appendChild(row);
                }

            //console.log(names);
        }
    };

    xhttp.open("GET", "/movies", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}


let seats = [];

// function getreservedseats() {

//     var xhttp = new XMLHttpRequest();
//     xhttp.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             //console.log(this.responseText);
//              seats = JSON.parse(this.responseText);
//            // console.log(seats[0]);
//            let temp = [];
//            for (let i = 0; i<seats.length; i++){
//                 let row = seats[i].row_numb;
//                 let no = seats[i].seat_numb;
//                 let seatid = row + no;
//                 temp.push(seatid);
//                 console.log(temp[i]);
//            }

//            let otherseat = document.getElementsByClassName("seat");
//            let temp2 = [];

//            for (let i =0; i<otherseat.length; i++){
//              otherseat[i].name;
//              console.log(otherseat);
//              temp2.push(otherseat);
//            }

//            for(let i= 0; i<temp.length; i++){
//             for(let j=0; j<temp2.length; j++){
//                 if(temp[i]=== temp2[j]){
//                     otherseat[j].style.display.none;
//                 }
//             }
//              }
//         }
//  };
//     xhttp.open("GET", "/availability", true);
//     xhttp.setRequestHeader("Content-type", "application/json");
//     xhttp.send();
// }