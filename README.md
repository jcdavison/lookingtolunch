This application is no longer in development.  I'm too busy with codeunion.io :smile:
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

- create a service that builds a chat room for each user that invited lunchers enter, structure the firebase data correctly


SPECS

FEATURE

  - create a url that can be tweeted that shows requesting user's twitter and chat room, enforces twitter auth from visiting twitter person
  - once information hits the server, how to process it and remove the luncher from the users lunchmate pool, i don't really think redis is needed here, i don't want to pump volume, i want people to pick up to three people a day to say hay to. 
  - i should be generating the pool when a user logs in or serves a get request
  - what is really more important is having a pool of users's who tweets has already been classified
  - cycle to next lunch mate in lunchmates array

STACK

  - sidekiq needs a daemon supervisor ? https://github.com/mperham/sidekiq/wiki/Deployment


FRONT END
  - create a scope method that cycles through and selects yes or now for lunchers
  - create a service that sends approriate data to server to select a lunch and send tweet

TECHNICAL DEBT
  NG-App
  - $scope.selectLunchMate
  - LunchMates.selectLunchMate 

NOTES

  - it is probably a bad ideas for any given twitter user to repeat requests to lunch from different users

```
  heroku ps:scale worker+1
  # seems useful
```
