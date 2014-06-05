class PaymentMethod < ActiveRecord::Base
  has_many :transactions

  # Attrs Validations
  validates :name, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :method_type, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :description, presence: true, length: { in: 3..140 }, on: [:create, :update]

  # Relations Validations
end
