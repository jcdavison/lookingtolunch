module.exports = function (config) {
  config.set({
    basePath: '../..',
    frameworks: ['jasmine'],
    autoWatch: true,
    preprocessors: {
      '**/*.coffee': 'coffee'
    },
    files: [
      'http://localhost:3000/assets/application.js',
      'spec/javascripts/lunch_controller_spec.js.coffee',
      {
        pattern: 'app/assets/javascripts/*.{js,coffee}',
        watched: true,
        included: false,
        served: false
      }
    ]
    // files: [
    //   JASMINE,
    //   JASMINE_ADAPTER,
    //   'http://rails.dev/assets/application.js',
    //   'spec/javascripts/*.js',
    //   { pattern: 'app/assets/javascripts/*.js',
    //     watched: true,
    //     included: false,
    //     served: false }
    // ]
    // files: [
    // 'app/assets/javascripts/angular.js',
    // 'app/assets/javascripts/angular-mocks.js',
    // 'app/assets/javascripts/angular-route.js',
    // 'app/assets/javascripts/angular/*',
    // 'app/assets/javascripts/app.js.coffee',
    // 'app/assets/javascripts/controllers.js.coffee',
    // 'app/assets/javascripts/services.js.coffee',
    // 'spec/javascripts/lunch_controller_spec.js.coffee'
    // ]
  });
};
