$(document).on('turbolinks:load', function(){
   $('.super-search').click(function(){
     $('.search-in-search').slideDown();
   });
   $("#log-in-button").click(function(){
       $(".post-wrapper").fadeOut(2000);
   });
   $(".panel-sign-in").fadeIn(1000);
   $(".btn2").click(function(){
       $(".panel-sign-in").slideDown();
   });
 });
