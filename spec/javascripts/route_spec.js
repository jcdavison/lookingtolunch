describe('Routes test', function() { 
  // Mock our module in our tests 
  beforeEach(angular.mock.module('Lunch'));
  var location, route, rootScope; 

  beforeEach(
    angular.mock.inject(function(_$location_, _$route_, _$rootScope_) {
      location = _$location_;
      route = _$route_;
      rootScope = _$rootScope_;
    }));

  describe('index route', function() {
    beforeEach(angular.mock.inject( 
      function($httpBackend) {
        $httpBackend.expectGET('/ngviews/lunch.html')
          .respond(200, 'main HTML');
      }));
        // Our tests will code here
      it('should load the lunch pool on succesfull load of /', function () {
        location.path('/');
        rootScope.$digest(); // calls the digest loop
        expect(route.current.controller).toBe('LunchPoolController')
      });
    }); 
});

// describe("E2E Route Test", function () {
//   beforeEach(function(){
//     browser().navigateTo('/');
//   });

//   it("should load the index page", function () {
//     expect(browser().location().path()).toBe('/');
//   });
// });
