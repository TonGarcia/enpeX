class DescriptionItem < ActiveRecord::Base
  belongs_to :project
  has_many :description_items

  # Attrs Validations
  validates :title, presence: true, length: { in: 3..75 }, on: [:create, :update]
  validates :long_description, presence: true, length: { in: 25..4294967290 }, on: [:create, :update]

  # Relations Validations
  validates :project_id, presence: true
end
