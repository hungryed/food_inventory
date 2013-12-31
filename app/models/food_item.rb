class FoodItem < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_uniqueness_of :title
  validates_presence_of :inventory
  validates_numericality_of :inventory
end
