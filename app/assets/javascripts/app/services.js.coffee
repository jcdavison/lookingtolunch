services = angular.module('Lunch.services', [] )
# the above is the setter
services.factory 'LunchMates', ($rootScope, $q, $http) ->
    LunchMates = 

      getLunchMates: () ->
        d = $q.defer(); 
        $http.get('/lunchers').then (response, status) ->
          d.resolve(response.data)
        return d.promise
      
      selectLunchMate: (lunchMate) ->
        data = 
          to: lunchMate.id
          toHandle: lunchMate.handle
        $http
          method: "post"
          data: data 
          url: '/api/v1/lunch_request'

    return LunchMates
