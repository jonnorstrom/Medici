$(document).ready( function(){
	$(':checkbox:checked').prop('checked',false);
	var total = +$('.unit-price').text() * +$('#drop-select option:selected').text();
    $('#grand-total').text(total);
	$('select').on('change', function()
	{	var total = +$('.unit-price').text() * +$('#drop-select option:selected').text();
    	$('#grand-total').text(total);
	});
});
