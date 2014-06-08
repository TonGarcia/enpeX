class ProjectGoal < ActiveRecord::Base
  belongs_to :currency
  belongs_to :project
end
