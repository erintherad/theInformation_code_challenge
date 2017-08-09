function toggleAll(onOrOff) {
  $('input.checkbox').each(function() {
    $(this).prop('checked', onOrOff);
  });
}

function updateSelectAll() {
  var allOn = true;

  $('input.checkbox').each(function() {
    if(!$(this).prop('checked')) {
      allOn = false;
      return; // we found one that is not checked, so we can stop
    }
  });

  $('#select_all').prop('checked', allOn);
}

$(document).ready(function() {
  $('#select_all').on('click', function() {
    toggleAll($(this).prop('checked'));
  });

  $('input.checkbox').on('click', function() {
    updateSelectAll();
  });
});
