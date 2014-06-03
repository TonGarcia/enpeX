class Project < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  def discounted_amount_invested
    Transaction.where(:project_id => self.id).sum(:discounted_value)
  end

  def total_amount_invested
    Transaction.where(:project_id => self.id).sum(:value)
  end

  def card_receipt
    if !transactions.first.nil? then total_amount_invested * transactions.first!.card_tax else 0.0 end
  end

  def company_receipt
    if !transactions.first.nil? then total_amount_invested * transactions.first!.company_tax else 0.0 end
  end
end
