class Project < ActiveRecord::Base
  belongs_to :user, :foreign_key => :creater_id, :class_name => 'User'
  has_many :transactions

  # Attrs Validations
  validates :name, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :resume, presence: true, length: { in: 3..144 }, on: [:create, :update]
  validates :url_video, presence: true, length: { in: 3..50 }, on: [:create, :update]

  # Relations Validations
  validates :creater_id, presence: true, on: [:create, :update]

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
