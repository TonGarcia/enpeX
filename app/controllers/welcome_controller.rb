class WelcomeController < ApplicationController
  skip_before_filter :setup_user, only: :home
  layout 'home'

  def home
    setup_user unless session['user_id'].nil?
    @projects = Project.all.limit(6)
    @user = User.new
  end

  private
  def solve_layout
    layout 'home'
    return true
  end
end
