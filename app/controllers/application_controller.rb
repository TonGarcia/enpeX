class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # SetUp Language
  before_action :set_locale

  # SetUp user
  before_action :setup_user, except: :sign_out
  before_filter :setup_user, except: :sign_out

  def setup_user
    unless session['user_id'].nil?
      @current_user = User.where(id: session['user_id']).take!
      session.delete('user_id') if @current_user.nil?
    end

    # SetUp the user to prevent finds on BD
    if session['user_id'].nil?
      if (params['controller'] != 'projects' && params['action'] != 'show')
        redirect_to root_path
        return
      end
    end
  end

  def set_locale
    I18n.locale = :pt || I18n.default_locale
  end
end
