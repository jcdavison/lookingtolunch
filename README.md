### http://lookingtolunch.herokuapp.com/

### Config Steps

```
  bundle install
  bundle exec rake db:create
  bundle exec rake parallel:create
  bundle exec rake parallel:prepare
  bundle exec rake db:migrate
  bundle exec rake db:test:prepare
  bundle exec rake user:create
```

#### make sure to run user:create task to get the right user created locally for the js tests.

#### Running the test suite


```
  redis-server
  bundle exec zeus start
  bundle exec guard
  bundle exec zeus server
  /usr/local/lib/node_modules/protractor/bin/webdriver-manager start
  karma start karma.conf.js
  protractor protractorConf.js
```

#### USEFUL BACKGROUND ON HOW TO SETUP KARMA/RAILS
http://sebastien.saunier.me/blog/2014/02/04/angular--rails-with-no-fuss.html


#### TODO

SPECS

FEATURE

  - in order to send a tweet, I need to know the originator's handle and recipients handle, i also want to track the ids of from and to

BACKEND
  - once a LunchRequest is created, trigger a tweet that notifies the LunchRequest.to
  - when a user signs up, run a server call to firebase that creates a new room for said user
  - ensure that if the redis instance returns nil, the app doesn't crash
  - is redis-mock actually working and not effecting production ? 

FRONT END
  - create a scope method that cycles through and selects yes or now for lunchers
  - create a service that sends approriate data to server to select a lunch and send tweet
  - create a service that builds a chat room for each user that invited lunchers enter

TECHNICAL DEBT
  NG-App
  - $scope.selectLunchMate
  - LunchMates.selectLunchMate 

NOTES

  - it is probably a bad ideas for any given twitter user to repeat requests to lunch from different users
