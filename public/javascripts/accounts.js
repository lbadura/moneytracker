mt.accounts = {};

/**
 *  New account form
 */
mt.accounts.newAccountForm = function() {
  this.form = $("#new-account-form");
  $.ajax({
    data: { 'authenticity_token' : authenticityToken },
    url: account_path("new"),
    type: 'GET',
    dataType: 'html',
    success: function(data) { 
      $.facebox(data);
      $('#add-account-button').bind('click', function(event) {
            event.stopPropagation();
            event.preventDefault();
            $.ajax({
              data: $(this.form).serialize(),
              url: account_path("create"),
              type: 'POST',
              dataType: 'json',
              success: function(envelope) {
                if (envelope.ok) {
                  $("div#accounts").load(account_path('refresh')); 
                  $.facebox.close();
                } else {
                  if (envelope.errors) {
                    mt.forms.displayRecordErrors('account', envelope);
                  }
                }
              }
            });
      });
    }
  });
  return false;
}

/**
 *  Setup all elements
 */
$(document).ready(function() {
  $("a#new-account-link").bind('click', mt.accounts.newAccountForm);  
});
