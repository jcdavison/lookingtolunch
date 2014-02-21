require 'spec_helper'

describe LunchRequest do

  context "requires from, to" do
    subject(:lunch_request) { build :lunch_request, from: nil, to: nil}
    it { lunch_request.valid?.should be_false}
  end

end
