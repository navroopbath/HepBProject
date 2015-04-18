var Calendar = {
  show_calendar: function() {
    var cal = $('#calendar')
    cal.fullCalendar({
      header: {
        left: 'month,agendaWeek,agendaDay',
        center: 'title',
        right: 'prev,today,next'
      },
      events: '/events'
    }); 
  }
  ,setup: function () {
    if (!$('.fc-view-container').length) {
      Calendar.show_calendar();
    }
  }
}

$(Calendar.setup);