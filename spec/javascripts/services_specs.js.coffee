describe "Lunch.Services", () ->
  beforeEach module("Lunch")

  describe "getLunchMates", () ->
    LunchMates 
    beforeEach inject(($injector) ->
      LunchMates = $injector.get('LunchMates')
    )
    it "returns something", ->
      expect(LunchMates.testFunction()).toBe "test"
