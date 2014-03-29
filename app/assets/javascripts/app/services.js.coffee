services = angular.module('Lunch.services', [] )
services.factory 'LunchMates', ($q, $http) ->
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

services.factory 'Chat', ($firebase) ->
  Chat = 
    setRoom: (twitter_handle) ->
      app_url = "http://lookingtolunch.firebaseio.com/#{twitter_handle}"
      firebase = new Firebase(app_url)

    # listMessages: (twitter_handle) ->
    #   app_url = "http://lookingtolunch.firebaseio.com/#{twitter_handle}"
    #   firebase = new Firebase(app_url)
      
  return Chat

services.factory 'User', ($q, $http) ->
  User =
    current: () ->
      console.log "trigger"
      d = $q.defer(); 
      $http.get('/api/current_user').then (response, status) ->
        d.resolve(response.data)
      return d.promise
  return User

