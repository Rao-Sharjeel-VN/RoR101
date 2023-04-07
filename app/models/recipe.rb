class Recipe < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :chef_id, presence: true	
	belongs_to :chef

end