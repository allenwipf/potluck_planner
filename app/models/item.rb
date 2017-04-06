class Item < ActiveRecord::Base
	belongs_to :potluck

	validates :name, presence: true
	validates :potluck_id, presence: true
end
