class DescriptionItem < ActiveRecord::Base
  belongs_to :project
  has_many :description_items
end
