class SocialSession < ActiveRecord::Base
  belongs_to :user

  # Attrs validations
  validates :id_on_social, presence: true, length: { in: 3..45 }, on: [:create, :update]
  validates :name, presence: true, length: { in: 3..65 }, on: [:create, :update]
  validates :username, presence: true, length: { in: 3..45 }, on: [:create, :update]
  validates :email, presence: true, length: { in: 3..55 }, on: [:create, :update]

  # Associations validations
  validates :user_id, presence: true
end
