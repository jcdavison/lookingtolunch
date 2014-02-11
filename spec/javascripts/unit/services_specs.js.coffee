describe "Lunch.Services", () ->

  beforeEach module('Lunch')
  httpBackend = lunchmates = null

  beforeEach inject ($httpBackend, LunchMates) ->
    lunchmates = LunchMates
    httpBackend = $httpBackend

  afterEach () ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'getLunchMates', () ->
    it 'returns an array of lunchmates', ->
      httpBackend.when('GET', '/lunchers').respond([])
      lunchmates.getLunchMates().then (data) ->
        expect(data).toEqual([])
      httpBackend.flush()
