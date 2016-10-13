
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
      if(hasClicked == false){
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
        setTimeout(function(){ $container.masonry('layout'); }, 300);
    });

    $(window).resize(function(){
       var width = $(window).width();
       if(width <= 768){
        setTimeout(function(){ $container.masonry('layout'); }, 700);
       }
    })

    $('.cart_form').on('click', function(e){
      if (!$("input[name='terms']").is(':checked')){
        e.preventDefault();
        alert("You must accept the Terms and Conditions")
      }
    });
});
