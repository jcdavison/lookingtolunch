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
  });
};
