/**
 * This file contains all accounts specific code
 */
mt = {};
mt.accounts = {};


/**
 *  New account form
 */
mt.accounts.newAccountForm = function() {
  $.ajax({
    data: { 'authenticity_token' : authenticityToken },
    url: account_path("new"),
    type: 'GET',
    dataType: 'html',
    success: function(data) { 
      $.facebox(data);
      $('#add-account-button').bind('click', function(event) 
        { 
            event.stopPropagation();
            event.preventDefault();
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
