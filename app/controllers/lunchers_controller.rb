class LunchersController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]
  layout :choose_layout

  def main

  end

  def choose_layout
    user_signed_in? ? "lookingtolunch" : "application"
  end

end
