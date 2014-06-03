class WelcomeController < ApplicationController
  layout 'home'

  def index
    @user = User.new
  end

  private
  def solve_layout
    layout 'home'
    return true
  end
end
