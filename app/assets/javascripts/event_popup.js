var EventPopup = {
  setup: function() {
    if (!$('.modal-dialog.draggable').length) {
      $(document).on('click', 'a.fc-day-grid-event', EventPopup.getEventInfo);
    }
  }
  ,getEventInfo: function() {
    $.ajax({type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: EventPopup.showEventInfo,
            error: function(xhrObj, textStatus, exception) { alert('Error!'); }
          });
    return(false);
  }
  ,showEventInfo: function(data, requestStatus, xhrObject) {
    $("#event-modal").html(data).modal({
      keyboard: true,
      backdrop: true
    });
  }
}
$(EventPopup.setup);