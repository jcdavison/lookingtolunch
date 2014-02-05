describe('E2E: main page', function() {
  var ptor;

  beforeEach(function() {
    ptor = protractor.getInstance();
    browser.driver.get('http://127.0.0.1:3000/users/sign_in');
    browser.driver.findElement(By.id("user_email")).sendKeys("test@test.com");
    browser.driver.findElement(By.id("user_password")).sendKeys("testtest");
    browser.driver.findElement(By.name("commit")).click();
    browser.driver.get('http://127.0.0.1:3000/')
  });
  
  it('be required to login', function() {
    ele = By.id('nope');
    expect(ptor.isElementPresent(ele)).toBe(true);
  });

});
