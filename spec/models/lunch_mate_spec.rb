require 'spec_helper'

describe LunchMate do

  context ".required_attributes" do
    it "returns required attributes" do
      @attributes = ["name", "info", "last_tweet", "pic", "handle"] 
      expect(LunchMate.required_attributes).to eq @attributes
    end

    it "invalid record if false attributes" do
      LunchMate.required_attributes.each do |attribute|
        lunch_mate = build :lunch_mate, "#{attribute}".to_sym => nil
        lunch_mate.valid?.should be_false
      end
    end

  end
end

