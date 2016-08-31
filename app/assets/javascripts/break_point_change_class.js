$(window).load(function(){
   var width = $(window).width();
   if(width <= 768){
       $('#dynamic-nav').removeClass('navbar-fixed-side').addClass('navbar-fixed-top');
   }
   else{
       $('#dynamic-nav').removeClass('navbar-fixed-top').addClass('navbar-fixed-side');
   }
})

$(window).resize(function(){
   var width = $(window).width();
   if(width <= 768){
       $('#dynamic-nav').removeClass('navbar-fixed-side').addClass('navbar-fixed-top');
   }
   else{
       $('#dynamic-nav').removeClass('navbar-fixed-top').addClass('navbar-fixed-side');
   }
})
