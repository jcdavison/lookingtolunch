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

### Running the test suite


```
  zeus start
  bundle exec guard
  zeus server
  /usr/local/lib/node_modules/protractor/bin/webdriver-manager start
  karma start spec/javascripts/lunch.conf.js
  redis-server
```



#### TODO

SPECS
  -  Lunch Services spec is not working, waiting for feedback on stackoverflow questions.

BACKEND
  -  ensure that if the redis instance returns nil, the app doesn't crash
  -  is redis-mock actually working and not effecting production ? 
  -  create specs around controller
FRONT END
  -  create a scope method that cycles through and selects yes or now for lunchers
  -  create a service that sends approriate data to server to select a lunch and send tweet
  -  create a service that builds a chat room for each user that invited lunchers enter
