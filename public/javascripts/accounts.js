mt.accounts = {};

/**
 *  New account form
 */
mt.accounts.newAccountForm = function() {
  this.form = $("#new-account-form");
  $.ajax({
    url: new_account_path(""),
    type: 'GET',
    dataType: 'html',
    success: function(data) {
      $.facebox(data);
      $('#add-account-button').bind('click', function(event) {
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
          data: $(this.form).serialize(),
          url: accounts_path(''),
          type: 'POST',
          dataType: 'json',
          success: function(envelope) {
            if (envelope.ok) {
              $(document).trigger("mt:accountsChanged");
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
  var accountId = mt.accounts.getAccountId($(ev.target));
  this.form = $("#new-account-form");
  $.ajax({
    url: account_path(accountId) + '/edit',
    type: 'GET',
    dataType: 'html',
    success: function(data) {
      $.facebox(data);
      $('#add-account-button').bind('click', function(event) {
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
          data: $(this.form).serialize(),
          url: account_path(accountId),
          type: 'PUT',
          dataType: 'json',
          success: function(envelope) {
            if (envelope.ok) {
              $(document).trigger("mt:accountsChanged");
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
 * Handle deleting accounts
 */
mt.accounts.deleteAccount = function(ev) {
  var accountId = mt.accounts.getAccountId($(ev.target));
  $.ajax({
    data: {
      'authenticity_token' : authenticityToken,
      'id' : accountId
    },
    url: account_path(accountId),
    type: 'DELETE',
    dataType: 'json',
    beforeSend: function() {
      return confirm("Are you sure you want to delete this account ?")
    },
    success: function(envelope) {
      if (envelope.ok) {
        $(document).trigger("mt:accountsChanged");
      } else {
    // FIXME: handle errors
    }
    }
  });
}

/**
 * Helper function to get account id according to a control icon clicked
 */
mt.accounts.getAccountId = function(element) {
  return element.parents().find("div.account-controls").attr("id").substr(17);
}

mt.accounts.changedHandler = function() {
  $("div#account-list").load(accounts_path('/refresh'));
  $.facebox.close();
}

/**
 *  Setup all elements
 */
$(document).ready(function() {
  $(document).bind("mt:accountsChanged", mt.accounts.changedHandler);
  $("a#new-account-link").live('click', mt.accounts.newAccountForm);
  $("a.edit-account-link").live('click', mt.accounts.editAccount);
  $("a.delete-account-link").live('click', mt.accounts.deleteAccount);
});
