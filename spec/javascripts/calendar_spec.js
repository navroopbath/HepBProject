describe('The calendar should show up with events in the right dates.', function() {
  beforeEach( function() {
    loadFixtures('calendar.html');
    var jsonResponse = getJSONFixture('event.json');
    spyOn($, 'ajax').and.callFake(function (ajaxArgs){
      ajaxArgs.success(jsonResponse, '200');
    });
    Calendar.setup();
  });
  
  describe('setup function', function() {

    it('should only generate one calendar', function() {
      var calendar = $('#calendar');
      expect($('.fc-view-container').length).toEqual(1);
    });

    // afterEach

  });

  describe('events rendered properly in calendar', function() {

    it('should make an ajax request to the proper URL', function() {
      expect($.ajax.calls.mostRecent().args[0]['url']).toEqual("/events");
    });

    it('should display Berkeley Clinic in the modal', function() {
      var test = $(.'fc-title');
      expect($('.fc-title').text()).toContain("Berkeley Clinic");
    });
  });

});
