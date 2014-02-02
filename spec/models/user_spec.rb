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

  context "instance methods" do
    before do
      $redis.flushdb
      5.times {|n| create :lunch_mate, handle: "honeybadger#{n}"}
    end

    context "#create_lunch_pool" do
      it {User.any_instance.expects(:create_lunch_pool).once}
      let(:user) {create :user}
    end

    context "#lunch_pool" do
      let(:user) {create :user}
      it { expect(user.lunch_pool.length).to eq 5 }
    end
  end

end
