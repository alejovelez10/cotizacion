var addDItemRow = function() {
  var $lastDItemRow = $('.d_item-row-fieldset:visible').last();
  var $newDItemRow = $lastDItemRow.clone();
  $newDItemRow.find('input').val('');
  $newDItemRow.find('.remove-d_item-row').show();
  var d_itemRowCount = $('.d_item-row-fieldset').length;

  var oldId = $newDItemRow.prop('id');
  var newId = oldId.replace(new RegExp(/[0-9]/), d_itemRowCount);
  $newDItemRow.prop('id', newId);

  $newDItemRow.find('label').each(function() {
    var oldLabel = $(this).attr('for');
    var newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_" + d_itemRowCount + "_");
    $(this).attr('for', newLabel);
  });

  $newDItemRow.find('input').each(function() {
    var oldId = $(this).attr('id');
    var newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + d_itemRowCount + "_");
    $(this).attr('id', newId);

    var oldName = $(this).attr('name');
    var newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + d_itemRowCount + "]");
    $(this).attr('name', newName);
  });

  removePersistedRecordFields($newDItemRow);
  $newDItemRow.insertAfter($lastDItemRow);
  manageFirstRowRemovalLink();
  bindRemovalLinks();
}

var removePersistedRecordFields = function($newDItemRow) {
  $newDItemRow.find('.id-field').remove();
  $newDItemRow.find('.removal-field').remove();
}

var bindRemovalLinks = function() {
  $('.remove-d_item-row').unbind('click').on('click', function() {
    var $fieldset = $(this).closest('div.d_item-row-fieldset');
    var $removalLink = $(this);

    manageRemovalLinks($fieldset, $removalLink);
  });
}

var manageRemovalLinks = function($fieldset, $removalLink) {
  event.preventDefault();
  var $confirmLinksDiv = $fieldset.find('.remove-confirm');
  var $confirmLinks = $confirmLinksDiv.find('.remove-d_item-row');

  $removalLink.hide();
  $confirmLinksDiv.css('display', 'inline');

  $confirmLinks.unbind('click').on('click', function() {
    event.preventDefault();
    var $confirmLink = $(this);

    if ($confirmLink.hasClass('yes')) {
      removeDItemRow($confirmLink);
    } else if ($confirmLink.hasClass('no')) {
      $confirmLink.closest('.remove-confirm').hide();
      $removalLink.show();      
    }
  });
}

var removeDItemRow = function($confirmLink) {
  var $fieldset = $confirmLink.closest('div.d_item-row-fieldset');
  var $removalField = $fieldset.find('.removal-field');

  if ($removalField.length != 0) {
    $removalField.val('true');
    $fieldset.hide();
  } else {
    $fieldset.remove();
  }
  manageFirstRowRemovalLink();
}

var manageFirstRowRemovalLink = function() {
  var $firstRow = $('.d_item-row-fieldset').first();
  var visibleDItemRowCount = $('.d_item-row-fieldset:visible').length;

  if (visibleDItemRowCount > 1) {
    $firstRow.find('.remove-d_item-row').show();
  } else {
    $firstRow.find('.remove-d_item-row').hide();
  }
}

var ready = function() {
  $('#add-d_item-row').on('click', function() {
    addDItemRow();
  });

  manageFirstRowRemovalLink();
  bindRemovalLinks();
}

$(document).ready(ready);
$(document).on('page:load', ready);