class LunchersController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!, :except => [:main]
  layout :choose_layout

  def index
    @lunch_pool = LunchMate.last(5)
    render json: @lunch_pool, status: 200
  end

  def choose_layout
    user_signed_in? ? "lookingtolunch" : "application"
  end
end
