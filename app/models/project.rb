class Project < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => :creator_id
  belongs_to :project_type
  has_one :project_goal
  has_many :transactions, foreign_key: :receiver_id
  has_many :description_items

  # Attrs Validations
  validates :name, presence: true, length: { in: 3..50 }, on: [:create, :update]
  validates :resume, presence: true, length: { in: 3..144 }, on: [:create, :update]
  validates :url_video, presence: false, length: { in: 3..50 }, on: [:create, :update]
  validates :active, presence: true, on: [:create, :update]

  # Relations Validations
  validates :creator_id, presence: true, on: [:create, :update]
  validates :project_type_id, presence: true, on: [:create, :update]

  # Attrs better named
  def owner
    self.user
  end

  def type
    self.project_type
  end

  def completed_goal_percentage

  end

  # TODO criar um btn gerar alias caso a pessoa não saiba que nome usar ou fazer igual o Face, só cria alias dps de um certo alcance
  def create_alias
    self.alias_name = self.name.downcase
    self.alias_name = self.alias_name.gsub(/ /, '-')
  end

  # MONEY/TRANSACTIONs methods
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

  # enpeX tax
  def company_receipt
    if !transactions.first.nil? then total_amount_invested * transactions.first!.company_tax else 0.0 end
  end
end
