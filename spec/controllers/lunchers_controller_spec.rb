require 'spec_helper'

describe LunchersController do

  context "authenticated user" do
    before do
      @user = create :user
      sign_in @user
    end
    context "GET '/'" do
      it "renders index view for non-logged in users" do
        get :main
        response.should render_template("layouts/lookingtolunch")
      end
    end
  end

  context "un-authenticated user" do
    context "GET '/'" do
      it "renders index view for non-logged in users" do
        get :main
        response.should render_template("layouts/application")
      end
    end
  end
end
