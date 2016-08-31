$(document).on('turbolinks:load', function(){
    $("#museum-toggle").click(function(){
        $(".museum-panel").fadeToggle();
    });
     $("#exhibition-toggle").click(function(){
        $(".exhibition-panel").fadeToggle();
    });
});
