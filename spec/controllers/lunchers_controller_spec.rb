require 'spec_helper'

describe LunchersController do
  context "GET root" do
    it "renders index view for non-logged in users" do
      get :main, {}
    end
  end
end
