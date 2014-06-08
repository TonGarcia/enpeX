class Currency < ActiveRecord::Base
  has_many :transactions
  has_many :project_goals
end
