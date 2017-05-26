// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/



//  Friday Flavor Vote test to only show form during allowed voting days and times.
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

  if (fri_form != null){
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
}


// Pie Chart creation for results of Friday Flavor Vote
document.addEventListener("DOMContentLoaded", function(){
  console.log("IM HERE");
  var flv=$("#myChart").data("flavors");
  var colors=[
    "#FF3AAE",
    "#952DE1",
    "#51A3A3",
    "#A4D789",
    "#D96C06"
  ];

  var lbls=[];
  var votes=[];
  for(cnt=0; cnt<flv.length; cnt++){
   lbls.push(flv[cnt].name),
   votes.push(flv[cnt].svy_vote)
  };

  var options={};
  var svy_data = {
    labels: lbls,
    datasets: [{
        data: votes,
        backgroundColor: colors,
        hoverBackgroundColor: colors
    }]
  };

  var ctx = document.querySelector("#myChart").getContext("2d");
  var pieChart = new Chart(ctx,{
      type: 'pie',
      data: svy_data,
      options: options
  });
});
