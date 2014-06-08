class Project < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => :creator_id
  has_many :transactions, foreign_key: :receiver_id
  has_many :description_items

  # Attrs Validations
  validates :name, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :resume, presence: true, length: { in: 3..144 }, on: [:create, :update]
  validates :url_video, presence: true, length: { in: 3..50 }, on: [:create, :update]

  # Relations Validations
  validates :creator_id, presence: true, on: [:create, :update]

  def owner
    self.user
  end

  def discounted_amount_invested
    if self.transactions.to_a.empty?
      0.0
    else
      Transaction.where(:project_id => self.id).sum(:discounted_value)
    end
  end

  def total_amount_invested
    if self.transactions.to_a.empty?
      0.0
    else
      Transaction.where(:project_id => self.id).sum(:value) unless self.transactions.to_a.empty?
    end
  end

  def card_receipt
    if !transactions.first.nil? then total_amount_invested * transactions.first!.card_tax else 0.0 end
  end

  def company_receipt
    if !transactions.first.nil? then total_amount_invested * transactions.first!.company_tax else 0.0 end
  end
end
