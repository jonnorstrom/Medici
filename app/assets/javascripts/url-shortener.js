$(document).on('turbolinks:load', function(){
	var shortenURL = function(s){
		sEnd = s.slice(s.length - 15);
		sStart = s.replace('http://', '').replace('https://', '').substr(0,14);
		var shorten = sStart + '...';
		document.getElementById("venue-website").innerHTML = shorten;
		return shorten;
	}
	shortenURL(document.getElementById("venue-website").innerHTML);
});