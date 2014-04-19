controllers = angular.module('Lunch.controllers', [] )

controllers.controller('LunchPoolController', ($scope, LunchMates, Chat, User, $firebase) ->
  n = 0
  chat_url = null

  LunchMates.getLunchMates().then (data) ->
    $scope.lunchers = data 
    setLunchMate()

  User.current().then (data) =>
    $scope.currentUser = data.user
    Chat.setRoom($scope.currentUser.twitter)
    chat_url = "http://lookingtolunch.firebaseio.com/#{$scope.currentUser.twitter}"
    chatroom = new Firebase(chat_url)
    $scope.messages = $firebase(chatroom)

  $scope.selectLunchMate = (lunchMate) ->
    LunchMates.selectLunchMate(lunchMate)
    incrementLunchMate()
    setLunchMate()


  $scope.sendMessage = (newMessage) ->
    chatroom = new Firebase(chat_url)
    chatroom.push({from: $scope.currentUser.twitter, message: newMessage})

  incrementLunchMate = () ->
    n += 1 unless n is $scope.lunchers.count - 1

  setLunchMate = () ->
    $scope.perspectiveLunchMate = $scope.lunchers[n]
)

controllers.controller('LunchChatController', ($scope, LunchMates, Chat, User, $firebase, $routeParams) ->

  chat_url = null
  lunchHost = $routeParams.user

  if lunchHost
    LunchMates.getLunchMate(lunchHost).then (data) ->
      $scope.lunchHost = data.success

    
    User.current().then (data) =>
      $scope.currentUser = data.user
      Chat.setRoom(lunchHost)
      chat_url = "http://lookingtolunch.firebaseio.com/#{lunchHost}"
      chatroom = new Firebase(chat_url)
      $scope.messages = $firebase(chatroom)

    $scope.sendMessage = (newMessage) ->
      chatroom = new Firebase(chat_url)
      chatroom.push({from: $scope.currentUser.twitter, message: newMessage})
)
