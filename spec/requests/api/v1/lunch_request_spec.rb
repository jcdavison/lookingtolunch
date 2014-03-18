require 'spec_helper'

describe Api::V1::LunchRequestController do

  context "unauthenticated user" do
    context "POST '/api/v1/lunch_request.json'" do
      it "responds 401" do
        post "/api/v1/lunch_request.json"
        response.status.should == 401
      end
    end
  end

  context "authenticated user" do
    let(:user) {create :user}

    before do
      login user
    end

    context "POST '/api/v1/lunch_request.json'" do
      context "correctly formed params" do
        it "response.body['info'] == 'letslunch'" do
          params = {to: 1, toHandle: "someperson"}
          post "/api/v1/lunch_request.json", params
          JSON.parse(response.body)["info"].should == "lets lunch"
        end
      end

      context "malformed params" do
        it "response.status == 400" do
          params = { lunch_request: {from: nil}}
          post "/api/v1/lunch_request.json", params
          response.status.should == 400
        end
      end
    end

  end
end
