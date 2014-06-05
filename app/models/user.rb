class User < ActiveRecord::Base
  has_one :social_session
  has_many :transactions
  has_many :projects

  # Attrs validations
  validates :name, presence: true, length: { in: 3..55 }, on: [:create, :update]
  validates :email, presence: true, length: { in: 3..55 }, on: [:create, :update]
  validates :academic_email, length: { in: 3..55 }, on: [:create, :update]
  validates :pass_salt, presence: true, length: { in: 3..29 }, on: [:create, :update]
  validates :password, presence: true, length: { in: 3..60 }, on: [:create, :update]

  # Associations validations

  validates_confirmation_of :password
  validates_confirmation_of :email
end
