# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`document.addEventListener("DOMContentLoaded", function(){
  // retrieving elements needed
   var comment_saveBtn=document.querySelector("#comment_saveBtn");
   var noThx=document.querySelectorAll(".noThx");
   var subModal=document.querySelector("#subModal");

  // Creating reset function to hide modal after user responds
   function reset(){
     event.preventDefault();
     subModal.style.display="none";
    //  subModal.style.z-index="1050";
     subModal.style.opacity="1";
   }

  // Adding Event Listener to each element found with noThx class
  for(count=0; count<noThx.length; count++){
    //Dismissing modal if user clicked "No Thanks"
    noThx[count].addEventListener("click", function(){
      event.preventDefault();
      var declined=true;
      reset();
      return declined;
    })
  }

  // Launching modal
  if (comment_saveBtn != null){
    comment_saveBtn.addEventListener("click", function(){
      event.preventDefault();
      subModal.style.display="block";
      //  subModal.style.z-index="1050";
      subModal.style.opacity="1";
    })
  }
 })`
