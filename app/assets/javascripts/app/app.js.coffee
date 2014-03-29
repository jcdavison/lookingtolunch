# the angular getter method that allows for later referencing of the angular object
app = angular.module('Lunch', ['ngRoute','Lunch.controllers', 'Lunch.services', 'firebase'])

app.config([ '$routeProvider', ($routeProvider) ->
  $routeProvider.when("/", { templateUrl: "/ngviews/lunch.html", controller: "LunchPoolController" } )
])

