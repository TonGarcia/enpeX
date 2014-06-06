class WelcomeController < ApplicationController
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
