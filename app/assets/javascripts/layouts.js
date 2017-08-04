//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("DOMContentLoaded", function(){
  var logoContainer=document.querySelector("#logo-container");
  var scrollUpBtn=document.querySelector("#scroll-up");
  var win=window;

  if (scrollUpBtn && scrollUpBtn != null){
    win.addEventListener("scroll", function(event){
      var px=logoContainer.offsetHeight;
      px=Number(px)/2;
      var offSet=win.pageYOffset;

      if (offSet >= px){
        //  Show button and make cursor hand
        scrollUpBtn.style.opacity=.5;
        scrollUpBtn.style.cursor="pointer";
      }
      else{
        //  Hide button and remove hand cursor
        scrollUpBtn.style.opacity=0;
        scrollUpBtn.style.cursor="default";
      }
    });

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
  }
})
