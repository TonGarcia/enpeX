class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # SetUp user
  before_action :setup_user
  before_filter :setup_user

  def setup_user
    # SetUp the user to prevent finds on BD
    if session['user_id'].nil?
      if params['action'] != 'sign_out' && params['action'] != 'home'
        if (params['controller'] != 'users' && params['action'] != 'create') || (params['controller'] != 'users' && params['action'] != 'login')
          redirect_to root_path
          return
        end
      end
    end

    if @current_user.nil? && !session['user_id'].nil?
      @current_user = User.where(id: session['user_id']).take!
      session.delete('user_id') if @current_user.nil?
    end
  end
end
