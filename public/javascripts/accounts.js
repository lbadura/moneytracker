$(document).ready(function() {
  $("a#new-account-link").click(function() showNewAccountForm());  
});

function showNewAccountForm() {
  $.ajax({
    data: { 'authenticity_token' : authenticityToken },
    url: account_path("new"),
    type: 'GET',
    dataType: 'html',
    success: function(data) { 
      $.facebox(data);
      $('#add-account-button').click(function(event) { event.stopPropagation(); alert('a nie ma !'); } );
    }
  });
  return false;
}
