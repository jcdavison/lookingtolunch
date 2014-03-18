# scopes are the glue between the view and data
# and are where the unique, dirty, two way bindings get controlled
# they are the source of truth for the application state
# scopes are hierarchical and nestable
# it is bad practice to allow dom interaction or data manipuluation in a controller

controllers = angular.module('Lunch.controllers', [] )

controllers.controller('LunchPoolController', ($scope, LunchMates) ->
    n = 0

    LunchMates.getLunchMates().then (data) ->
      $scope.lunchers = data 
      setLunchMate()

    $scope.selectLunchMate = (lunchMate) ->
      LunchMates.selectLunchMate(lunchMate)
      incrementLunchMate()
      setLunchMate()

    incrementLunchMate = () ->
      n += 1 unless n is $scope.lunchers.count - 1

    setLunchMate = () ->
      $scope.perspectiveLunchMate = $scope.lunchers[n]
  )
