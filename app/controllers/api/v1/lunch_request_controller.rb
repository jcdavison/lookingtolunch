class Api::V1::LunchRequestController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def create
    lunch_request = LunchRequest.new from: current_user.id, to: params[:to], to_handle: params[:toHandle], from_handle: current_user.twitter
    if lunch_request.save
      render json: {info: "lets lunch"}
    else
      render json: {info: "no soup for you"}, status: 400
    end
  end


end
