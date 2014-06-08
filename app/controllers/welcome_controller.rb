class WelcomeController < ApplicationController
  skip_before_filter :setup_user, only: :home
  layout 'home'

  def home
    @user = User.new
  end

  private
  def solve_layout
    layout 'home'
    return true
  end
end
