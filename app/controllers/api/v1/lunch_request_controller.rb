class Api::V1::LunchRequestController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def create
    lunch_request = LunchRequest.new from: current_user.id, to: params[:lunch_request][:from]
    if lunch_request.save
      render json: {info: "lets lunch"}, status: 200
    else
      render json: {info: "no soup for you"}, status: 400
    end
  end
end
