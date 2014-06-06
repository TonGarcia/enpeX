class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # SetUp user
  before_action :setup_user, :except => [:home, 'users#create']

  def setup_user
    # SetUp the user to prevent finds on BD
    if session['user_id'].nil? && params['action'] != 'sign_out'
      redirect_to root_path
      return
    end
    if @user.nil? then @user = User.find(session['user_id']) end
  end
end
