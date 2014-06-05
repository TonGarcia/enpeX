class User < ActiveRecord::Base
  has_one :social_session
  has_many :transactions
  has_many :projects

  validates_confirmation_of :password
  validates_confirmation_of :email
end
