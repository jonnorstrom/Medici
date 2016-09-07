$(document).on('turbolinks:load', function(){
	document.getElementById('museum-toggle').focus();
    $("#museum-toggle").click(function(){
        $(".museum-panel").fadeToggle();
    });
    document.getElementById('exhibit-toggle').focus();
     $("#exhibit-toggle").click(function(){
        $(".exhibit-panel").fadeToggle();
    });
     document.getElementById('event-toggle').focus();
     $("#event-toggle").click(function(){
        $(".event-panel").fadeToggle();
    });
});
