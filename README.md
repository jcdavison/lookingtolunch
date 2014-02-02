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
```
