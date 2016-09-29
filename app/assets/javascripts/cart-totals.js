$(document).on('turbolinks:load', function(){
	var total = +$('.unit-price').text() * +$('#drop-select option:selected').text();
    $('#grand-total').text(total);
	$('select').on('change', function()
	{	var total = +$('.unit-price').text() * +$('#drop-select option:selected').text();
    	$('#grand-total').text(total);
	});
});
// var rateVal = parseInt($("#rate").text(), 10);
//var number = +$("#rate").text();
//$( "#myselect option:selected" ).text();
//$('#one span').text('Hi I am replace');