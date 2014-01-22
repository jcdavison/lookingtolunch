require 'spec_helper'

describe Users::SessionsController do
  context "authenticated user" do
    before do
      @user = create :user
      sign_in @user
    end

    context "GET '/api/current_user'" do
      it "return a valid user JSON object" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :show_current_user 
        JSON.parse(response.body)["success"].should be_true
      end
    end
  end

  context "un-auth user" do
    context "GET '/api/current_user'" do
      it "returns false" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :show_current_user 
        JSON.parse(response.body)["success"].should be_false
        JSON.parse(response.body)["info"].should == "Unauthorized"
      end
    end
  end

end

