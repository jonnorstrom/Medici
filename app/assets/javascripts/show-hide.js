$(document).on('turbolinks:load', function(){
	document.getElementById('museum-toggle').focus();
    $("#museum-toggle").click(function(){
        $(".museum-panel").fadeToggle();
    });
     $("#exhibition-toggle").click(function(){
        $(".exhibition-panel").fadeToggle();
    });
});
