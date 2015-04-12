describe('The calendar should show up with events in the right dates.', function() {
  beforeEach( function() {
    loadFixtures('calendar.html');
    spyOn($, 'ajax');
    Calendar.setup();
  });
  
  describe('setup function', function() {

    it('should only generate one calendar', function() {
      var calendar = $('#calendar');
      expect($('.fc-view-container').length).toEqual(1);
    });

    afterEach

  });

  describe('events rendered properly in calendar', function() {

    it('should make an ajax request to the proper URL', function() {
      expect($.ajax.calls.mostRecent().args[0]['url']).toEqual("/events");
    });

  });
});