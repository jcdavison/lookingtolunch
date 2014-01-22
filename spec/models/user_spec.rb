require 'spec_helper'

describe User do
  it "requires valid name" do
    user = build :user, name: nil
    user.valid?.should be_false
  end

  it "requires valid email" do
    user = build :user, email: nil
    user.valid?.should be_false
  end

  it "requires valid password" do
    user = build :user, password: nil
    user.valid?.should be_false
  end
end
