// $(document).on('ready', function() {
//   $('#calendar').fullCalendar();
// });

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
