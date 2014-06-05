class PaymentMethod < ActiveRecord::Base
  has_many :transactions
end
