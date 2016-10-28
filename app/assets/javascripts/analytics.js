$(document).on('page:change', function() {
 if (window._gaq != null) {
  return _gaq.push(['_trackPageview']);
} else if (window.pageTracker != null) {
  return pageTracker._trackPageview();
 }
});

var trackOutboundLink = function(url) {
ga('send', 'event', 'outbound', 'click', url, {
  'transport': 'beacon',
  'hitCallback': function(){document.location = url;}
});
}
