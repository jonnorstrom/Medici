$(document).ready(function(){
	var shortenURL = function(s){
		sEnd = s.slice(s.length - 15);
		sStart = s.replace('http://www.', '').replace('https://www.', '').substr(0,14);
		var shorten = sStart + '.com';
		document.getElementById("venue-website").innerHTML = shorten;
		return shorten;
	}
	if(document.getElementById("venue-website")){
		shortenURL(document.getElementById("venue-website").innerHTML);
	} 
});
