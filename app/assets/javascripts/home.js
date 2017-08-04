// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $(".parallax").parallax();
  $(".button-collapse").sideNav();

// document.addEventListener("DOMContentLoaded", function(){
  var slides=document.querySelectorAll("#slides .slide");
  var cartL=document.querySelector("#home-cart-lnk");
  var cart=document.querySelector(".home-cart");
  var currentSlide = 0;
  setInterval(nextSlide,4000);

  function nextSlide(){
    // Encase attaching eventlistened in if statement to prevent js errors in console
    if (slides.length > 0){
      slides[currentSlide].className = "slide";
      currentSlide = (currentSlide+1)%slides.length;
      slides[currentSlide].className = "slide showing";
    }
  }

  // Encase attaching eventlistened in if statement to prevent js errors in console
  if (cartL && cartL != null){
    var driveCart=function(){
      cartL.classList.add("fadeIn");
      cartL.style.opacity=1;
      cart.classList.add("bounce");
      setTimeout(function(){
        cart.style.opacity=1;
      },2000);
      setTimeout(function(){
        cart.classList.add("home-cartSpeed");
        var cartSpeed=document.querySelector(".home-cartSpeed");
        cartSpeed.addEventListener("animationend", function(event){
          cart.classList.remove("bounce");
          cart.classList.remove("lightSpeedOut");
          cart.classList.remove("home-cartSpeed");
          cart.style.opacity=0;
          cartL.classList.remove("fadeIn");
        });
        cartSpeed.classList.add("lightSpeedOut");
      },4000);
    }

    window.addEventListener("scroll", function(){
      var offSet=window.pageYOffset;
      // console.log("Your at "+ offSet);
      if (offSet > 950 && offSet < 1800){
        driveCart();
      }
    });
  }
});
