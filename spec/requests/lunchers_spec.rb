require 'spec_helper'
#make sure redis is running locally

describe LunchersController do
  before do
    5.times {|n| create :lunch_mate, handle: "honeybadger#{n}"} 
  end

  context "authenticated user" do
    let(:user) {create :user}

    before do
      login user
    end

    context "GET '/'" do
      it "renders lookingtolunch angular app" do
        get "/"
        response.should render_template("layouts/lookingtolunch")
      end
    end

    context "GET /lunchers.json returns current_user's pool of lunch mates" do
      before do
        get '/lunchers.json'
      end
      it {expect(json.length).to eq 5}
    end
  end

  context "un-authenticated user" do
    context "GET '/'" do
      it "renders index view for non-logged in users" do
        get "/"
        response.should render_template("layouts/application")
      end
    end
  end
end
