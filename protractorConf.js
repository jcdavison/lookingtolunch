exports.config = {
  seleniumAddress: 'http://0.0.0.0:4444/wd/hub',
  capabilities: { 'browserName': 'chrome' },
  specs: ['spec/javascripts/integration/main_spec.js'],
  baseUrl: 'http://127.0.0.1:3000/',
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 50000
  }
};
