
$(document).ready(function() {
	if ($(window).width() <= 768){
		var visited = localStorage.getItem('visited');
		if (visited) {
	  		localStorage.setItem('visited', true);
			$('#signUpModal').modal('show');
		}
	}

});
