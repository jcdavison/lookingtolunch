services  = angular.module('Lunch.services', [] )
services.factory 'LunchMates', ($rootScope, $q, $http) ->
    LunchMates = 

      getLunchMates: () ->
        d = $q.defer(); 
        $http.get('/lunchers').then (response, status) ->
          d.resolve(response.data)
        return d.promise

      testFunction: () ->
        "test"

    return LunchMates
