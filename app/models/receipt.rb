class Receipt < ActiveRecord::Base
  belongs_to :transaction

  # Attrs Validations
  validates :token, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :id_on_operator, presence: true, length: { in: 3..45 }, on: [:create, :update]
  validates :url_access, presence: true, length: { in: 3..140 }, on: [:create, :update]

  # Relations Validations
  validates :transaction_id, presence: true
end
