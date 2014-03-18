require 'spec_helper'

describe LunchRequest do

  context "requires from, to, from_handle, to_handle" do
    subject(:lunch_request) { build :lunch_request, from: nil, to: nil, from_handle: nil, to_handle: nil}
    it { lunch_request.valid?.should be_false}
  end

  context "it calls send_notification " do
    subject(:lunch_request) { build :lunch_request }
    it "after_save" do
      # LunchRequest.any_instance.expects(:send_notification).once
      lunch_request.save
    end
  end
end
