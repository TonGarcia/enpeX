class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
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
