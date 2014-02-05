describe "Lunch controller", ->
  beforeEach module('Lunch')

  describe "LunchCtrl", ->
    it "should set images to a populated array", inject(($controller) ->
      scope = {}
      ctrl = $controller("LunchPoolController",
        $scope: scope
      )
      expect(scope.lunchers.length).toBe 1
    )
