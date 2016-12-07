
$(document).ready(function(){

   var $container = $('.masonry-container');
   $container.imagesLoaded(function(){
       $container.masonry({
       itemSelector : '.post-wrapper',
       columnWidth: function( containerWidth ) {
           return containerWidth /3;
           }(), // () to execute the anonymous function right away and use its result
           isAnimated: true
       });
   });
   $(window).resize(function(){
      var width = $(window).width();
      if(width <= 768){
       setTimeout(function(){ $container.masonry(); }, 700);
      }
   });

   $( "#museum-toggle" ).prop( "checked", true );
   $( "#exhibit-toggle" ).prop( "checked", true );
   $( "#event-toggle" ).prop( "checked", true);
   var hasClicked = false;
   $(".checkbox-wrapper").click(function(){
     if(hasClicked === false){
        $( "#museum-toggle" ).prop( "checked", false );
        $( "#exhibit-toggle" ).prop( "checked", false );
        $( "#event-toggle" ).prop( "checked", false );

        $('.museum-panel').hide();
        $('.exhibit-panel').hide();
        $('.event-panel').hide();
        hasClicked = true;
        $( "this" ).prop("checked", true);
     }
   });
   $( "#museum-toggle" ).change(function() {
       if($(this).prop("checked")) {
         $('.museum-panel').show();
       }
       else {
         $('.museum-panel').hide();
       }
       setTimeout(function(){ $container.masonry(); }, 300);
   });
   $( "#exhibit-toggle" ).change(function() {
       if($(this).prop("checked")) {
         $('.exhibit-panel').show();
       }
       else {
         $('.exhibit-panel').hide();
       }
       setTimeout(function(){ $container.masonry(); }, 300);
   });
   $( "#event-toggle" ).change(function() {
       if($(this).prop("checked")) {
         $('.event-panel').show();
       }
       else {
         $('.event-panel').hide();
       }
       setTimeout(function(){ $container.masonry(); }, 300);
   });
   $('.cart_form').on('click', function(e){
     if (!$("input[name='terms']").is(':checked')){
       e.preventDefault();
       alert("You must accept the Terms and Conditions")
     }
   });
   $(".button-museum").click(function(){
    $(".exhibit-panel").hide();
    $(".event-panel").hide();
    $(".museum-panel").show();
    setTimeout(function(){ $container.masonry(); }, 300);
   })
   $(".button-exhibit").click(function(){
    $(".museum-panel").hide();
    $(".event-panel").hide();
    $(".exhibit-panel").show();
    setTimeout(function(){ $container.masonry(); }, 300);
   })
   $(".button-event").click(function(){
    $(".exhibit-panel").hide();
    $(".museum-panel").hide();
    $(".event-panel").show();
    setTimeout(function(){ $container.masonry(); }, 300);
   })
});
