class User < ActiveRecord::Base
  validates_confirmation_of :password
  validates_confirmation_of :email
end
