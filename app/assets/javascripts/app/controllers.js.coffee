angular.module('Lunch.controllers', [])
  .controller('LunchCtrl', ($scope, LunchMates) ->
    $scope.lunchers = LunchMates.get()
  )
