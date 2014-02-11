services = angular.module('Lunch.services', [] )
# the above is the setter
services.factory 'LunchMates', ($rootScope, $q, $http) ->
    LunchMates = 

      getLunchMates: () ->
        d = $q.defer(); 
        $http.get('/lunchers').then (response, status) ->
          d.resolve(response.data)
        return d.promise

    return LunchMates
