$(document).ready(function() {
  $('a#create').click(function(e) {
    e.preventDefault();
    
    $.post('/apples.xml', { apple: { color: 'red' }}, function(data) {
      alert('complete');
    });
  });
});