$(document).on('turbolinks:load', function(){

    var $container = $('.masonry-container');

    $container.imagesLoaded(function(){
        $container.masonry({
        itemSelector : '.post-wrapper',
        columnWidth : '.post-wrapper',
        });
    });
	  document.getElementById('museum-toggle').focus();
    $("#museum-toggle").click(function(){
        $(".museum-panel").toggle();
        setTimeout(function(){ $container.masonry('layout'); }, 300);
    });
    document.getElementById('exhibit-toggle').focus();
     $("#exhibit-toggle").click(function(){
        $(".exhibit-panel").toggle();
        setTimeout(function(){ $container.masonry('layout'); }, 300);
    });
     document.getElementById('event-toggle').focus();
     $("#event-toggle").click(function(){
        $(".event-panel").toggle();
        setTimeout(function(){ $container.masonry('layout'); }, 300);
    });

    $container.on( 'click', '.museum-panel', function() {
        $( this ).css('z-index','10');
        $( this ).toggleClass('col-lg-3').toggleClass('col-lg-6');
        setTimeout(function(){ $container.masonry(); $( this ).css('z-index','1'); }, 300);
    });
});


