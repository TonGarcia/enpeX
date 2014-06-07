class Transaction < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', foreign_key: :payer_id
  belongs_to :project, :class_name => 'Project', foreign_key: :receiver_id
  belongs_to :payment_method
  has_one :receipt

  # Attrs validations
  validates :value, presence: true, on: [:create, :update]
  validates :currency, presence: true, length: { in: 3..30 }, on: [:create, :update]
  validates :banking, presence: true, on: [:create, :update]

  # Associations validations
  validates :payer_id, presence: true, on: [:create, :update]
  validates :receiver_id, presence: true, on: [:create, :update]
  validates :payment_method_id, presence: true, on: [:create, :update]

  before_create :charge
  before_save :charge

  def charge
    self.discounted_value = self.value - (self.value * self.card_tax) - (self.value * self.company_tax)
  end

  def card_tax
    self.card_tax = 0.05
  end

  def company_tax
    self.company_tax = 0.02
  end
end
