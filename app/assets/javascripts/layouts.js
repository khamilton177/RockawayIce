//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("DOMContentLoaded", function(){
  var scrollUpBtn=document.querySelector("#scroll-up");

  var scrollUp=function(element, to, duration) {
    if (duration <= 0) return;
    var move = to - element.scrollTop;
    var perpx = move / duration * 10;

    setTimeout(function() {
      element.scrollTop = element.scrollTop + perpx;
      if (element.scrollTop == to) return;
      scrollUp(element, to, duration - 10);
    }, 10);
  }

  scrollUpBtn.addEventListener("click", function(event){
    event.preventDefault();
    scrollUp(document.body, 0, 600);
  });
})
