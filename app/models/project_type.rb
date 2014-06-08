class ProjectType < ActiveRecord::Base
  has_many :projects

  # Attrs Validations
  validates :name, presence: true, length: { in: 3..50 }, on: [:create, :update]
end
