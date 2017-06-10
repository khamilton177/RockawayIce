// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $(".parallax").parallax();
  $(".button-collapse").sideNav();
});

document.addEventListener("DOMContentLoaded", function(){
  var slides=document.querySelectorAll("#slides .slide");
  var cartL=document.querySelector("#home-cart-lnk");
  var cart=document.querySelector(".home-cart");
  var currentSlide = 0;
  setInterval(nextSlide,4000);
  setInterval(driveCart,11000);

  function nextSlide(){
    // Encase attaching eventlistened in if statement to prevent js errors in console
    if (slides.length > 0){
      slides[currentSlide].className = "slide";
      currentSlide = (currentSlide+1)%slides.length;
      slides[currentSlide].className = "slide showing";
    }
  }

  // if (cartL !== null){
    function driveCart(){
      cartL.classList.add("fadeIn");
      cartL.style.opacity=1;
      setTimeout(function(){
        cart.style.opacity=1;
        cart.classList.add("bounce");
      },1000);
    }

    cartL.addEventListener("animationend", function(event){
      cartL.classList.remove("fadeIn");
    });

    cart.addEventListener("animationend", function(event){
      cart.classList.remove("bounce");
      setTimeout(function(){
        cart.classList.add("lightSpeedOut");
      },1000);
    });

    cart.addEventListener("animationend", function(event){
      setTimeout(function(){
        cart.classList.remove("lightSpeedOut");
        cart.style.opacity=0;
      },7000);
    });

    // setTimeout(function(){
    //   cartL.style.opacity=0;
    // },8000);
  // }
});
