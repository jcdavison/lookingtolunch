namespace :user do
  desc "create user require for javascript e2e/protractor specs"
  task :create => :environment do
    User.create name: "testuser", email: "test@test.com", password: "testtest"
  end
end
