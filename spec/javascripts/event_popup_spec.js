describe('Events should render and', function() {
  beforeAll( function() {
    loadFixtures('event_fixture.html');
    spyOn($, 'ajax').and.callFake(function() {
      EventPopup.showEventInfo("<div class='modal-dialog draggable'><div class='modal-content'><div class='modal-header'><button id='x-close'></button><h2 class='modal-title'>Event: Berkeley Clinic</h2></div><div class='modal-body'><ul class='fa-ul errors'></ul></div></div></div></div>");
    });
    EventPopup.setup()
  });

  it('should display a modal with event information when clicking on an event', function() {
    $('a.fc-day-grid-event').click();
    expect($('.modal-dialog.draggable').length).toEqual(1);
    expect($('.modal-title').text()).toBe('Event: Berkeley Clinic')
  });
});
