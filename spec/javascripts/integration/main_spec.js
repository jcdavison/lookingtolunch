describe('E2E: main page', function() {
  var ptor;

  beforeEach(function() {
    browser.get('http://0.0.0.0:3000');
    ptor = protractor.getInstance();
  });

  var ele = by.id('title');
  expect(ptor.isElementPresent(ele)).toBe(true);

});
