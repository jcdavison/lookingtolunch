require 'spec_helper'

describe LunchMate do

  context ".required_attributes" do
    it "returns required attributes" do
      @attributes = ["name", "info", "last_tweet", "pic", "handle"] 
      expect(LunchMate.required_attributes).to eq @attributes
    end
  end

  it "invalid record unless required attributes" do
    LunchMate.required_attributes.each do |attribute|
      lunch_mate = build :lunch_mate, "#{attribute}".to_sym => nil
      lunch_mate.valid?.should be_false
    end
  end

  it "enforces uniquess of twitter handle" do
    create :lunch_mate
    lunch_mate = build :lunch_mate
    lunch_mate.save.should be_false
  end

end

