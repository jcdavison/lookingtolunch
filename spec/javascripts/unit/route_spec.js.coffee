describe ('Routes test'), () ->

  beforeEach module('Lunch')
  
  location = route = rootScope = null

  beforeEach inject ($location, $route, $rootScope) ->
    location = $location
    route = $route
    rootScope = $rootScope

  describe 'index', () ->
    beforeEach inject ($httpBackend) ->
      $httpBackend.expectGET('/ngviews/lunch.html').respond(200, 'main HTML')

    it 'loads LunchPoolController', () ->
      location.path('/')
      rootScope.$digest()
      expect(route.current.controller).toBe('LunchPoolController')
