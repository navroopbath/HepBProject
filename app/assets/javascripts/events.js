var Calendar = {
  show_calendar: function() {
    $('#calendar').fullCalendar({
      header: {
        left: 'month,agendaWeek,agendaDay',
        center: 'title',
        right: 'prev,today,next'
      },
      events: '/events'  
    }); 
  },
  setup: function () {
    Calendar.show_calendar()
  }
}
$(Calendar.setup)

// var MoviePopup = {
//   setup: function() {
//     // add hidden 'div' to end of page to display popup:
//     var popupDiv = $('<div id="movieInfo"></div>');
//     popupDiv.hide().appendTo($('body'));
//     $(document).on('click', '#movies a', MoviePopup.getMovieInfo);
//   }
//   ,getMovieInfo: function() {
//     $.ajax({type: 'GET',
//             url: $(this).attr('href'),
//             timeout: 5000,
//             success: MoviePopup.showMovieInfo,
//             error: function(xhrObj, textStatus, exception) { alert('Error!'); }
//             // 'success' and 'error' functions will be passed 3 args
//            });
//     return(false);
//   }
//   ,showMovieInfo: function(data, requestStatus, xhrObject) {
//     // center a floater 1/2 as wide and 1/4 as tall as screen
//     var oneFourth = Math.ceil($(window).width() / 4);
//     $('#movieInfo').
//       css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
//       html(data).
//       show();
//     // make the Close link in the hidden element work
//     $('#closeLink').click(MoviePopup.hideMovieInfo);
//     return(false);  // prevent default link action
//   }
//   ,hideMovieInfo: function() {
//     $('#movieInfo').hide();
//     return(false);
//   }
// };
// $(MoviePopup.setup);

// function resize(event, dayDelta, minuteDelta){
//   $.ajax({
//     type: 'PUT',
//     dataType: 'script',
//     url: event.update,
//     contentType: 'application/json',
//     data: JSON.stringify({
//       event: { id: event.id, finish: event.end },
//       _method:'put'
//     })
//   });
// }

// function drop(event, dayDelta, minuteDelta){
//   $.ajax({
//     type: 'PUT',
//     dataType: 'script',
//     url: event.update,
//     contentType: 'application/json',
//     data: JSON.stringify({
//       event: { id: event.id, start: event.start, finish: event.end },
//       _method:'put'
//     })
//   });
// }

// $(document).on('page:change', function() {
//   $('#calendar').fullCalendar({
//     header: {
//       left: 'prev,next today',
//       center: 'title',
//       right: 'month,agendaWeek,agendaDay'
//     },
//     height: 600,
//     editable: true,
//     resizable: true,
//     events: '/events',
//     eventRender: function(event, element) {
//       $('a.fc-event-draggable').attr('data-remote', true);
//     },
//     eventResize: function(event, dayDelta, minuteDelta) {
//       resize(event, dayDelta, minuteDelta);
//     },
//     eventDrop: function(event, dayDelta, minuteDelta, allDay){
//       drop(event, dayDelta, minuteDelta);
//     }
//   });
// });
