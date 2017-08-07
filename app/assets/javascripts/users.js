$(document).ready(function() {
  $('input#all_email_preferences').on('click', function() {
    $('input:checkbox[name=emailList]').prop('checked', this.checked);
  });
});
