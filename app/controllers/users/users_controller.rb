class Users::UsersController < Devise::SessionsController
  respond_to :json
  before_filter :reject_if_not_authorized_request!

  def is_user
    render status: 200,
      json: {
        success: !User.find_by_name(params[:name]).blank?
      }
  end

  def show_lunch_host
    render status: 200,
      json: {
        success: LunchMate.find_by_handle(params[:twitter]).show_lunch_info
      }
  end

  private

  def reject_if_not_authorized_request!
    warden.authenticate!(
      scope: resource_name,
      recall: "#{controller_path}#failure")
  end

end
