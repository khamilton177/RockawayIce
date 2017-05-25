// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', cutOffVote);
function cutOffVote(){

  var vote_cl = document.querySelector(".flv_vote_cl");
  var fri_form = document.querySelector("#flavor_friday_form");

  console.log(fri_form);

  var vote_time=new Date();
  var dayNow=vote_time.getDay();
  var hrNow=vote_time.getHours();
  console.log("Day- "+ dayNow);
  console.log("Hour- "+ hrNow);

  if (dayNow >= 3 && dayNow !=6 && hrNow >= 17){
    vote_cl.style.opacity=1;
    fri_form.style.opacity=0;
    console.log("Closed");
  }
  else{
    vote_cl.style.opacity=0;
    fri_form.style.opacity=1;
    console.log("Open");
  }
}
