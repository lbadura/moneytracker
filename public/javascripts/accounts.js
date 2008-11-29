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
 * Edit account button
 */
mt.accounts.editAccount = function(ev) {
  alert('To be implemented');
}

/**
 * Handle deleting accounts
 */
mt.accounts.deleteAccount = function(ev) {
  accountId = $(ev.target).parents().find("div.account-controls").attr("id").substr(17);
  $.ajax({
    data: { 'authenticity_token' : authenticityToken, 'id' : accountId },
    url: account_path(accountId),
    type: 'DELETE',
    dataType: 'json',
    beforeSend: function() { return confirm("Are you sure you want to delete this account ?")},
    success: function(envelope) {
      if (envelope.ok) {
        $("div#accounts").load(account_path('refresh')); 
      } else {
        // FIXME: handle errors
      }
    }
  });
}

/**
 *  Setup all elements
 */
$(document).ready(function() {
  $("a#new-account-link").livequery('click', mt.accounts.newAccountForm);  
  $("a.edit-account-link").livequery('click', mt.accounts.editAccount);
  $("a.delete-account-link").livequery('click', mt.accounts.deleteAccount);
});
