angular.module('Lunch.services', [])
  .factory 'LunchMates', ($rootScope, $q, $http) ->
    LunchMates = 
      get: () ->
        people = [
          {handle: "@jcdavison", name: "person1", img: "https://pbs.twimg.com/profile_images/378800000695055178/42150d65b5a81d319a9bf280adc530dc.jpeg", info: "something interesting"}, 
          {handle: "@jcdavison", name: "person2", img: "https://pbs.twimg.com/profile_images/378800000825792839/f028b7a5a19718e0e4bcad31b1db6ddf.jpeg", info: "moreinformation"}, 
          {handle: "@jcdavison", name: "person3", img: "https://pbs.twimg.com/profile_images/378800000695055178/42150d65b5a81d319a9bf280adc530dc.jpeg", info: "something interesting"}, 
          {handle: "@jcdavison", name: "person4", img: "https://pbs.twimg.com/profile_images/378800000825792839/f028b7a5a19718e0e4bcad31b1db6ddf.jpeg", info: "moreinformation"} ]
        # this is going to need to be bound to a model or something on the rails server...
        return people
    return LunchMates
