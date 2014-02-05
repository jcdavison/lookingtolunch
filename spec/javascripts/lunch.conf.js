module.exports = function (config) {
  config.set({
    basePath: '../..',
    frameworks: ['jasmine'],
    autoWatch: true,
    autoWatchBatchDelay: 1000,
    preprocessors: {
      '**/*.coffee': 'coffee'
    },
    browswers: ['Chrome'],
    files: [
      'http://localhost:3000/assets/application.js',
      // 'spec/javascripts/lunch_controller_spec.js.coffee',
      'spec/javascripts/*.{js,coffee}',
      {
        pattern: 'app/assets/javascripts/*.{js,coffee}',
        watched: true,
        included: true,
        served: false
      }
    ],
    // urlRoot: '/__karma/',
    proxies: {
    '/': 'http://localhost:3000'
    }
  });
};
