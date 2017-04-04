class Potluck < ActiveRecord::Base
	has_many :items  #, dependent :destroy
	belongs_to :users
	validates :title, presence: true
	validates :location, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :user_id, presence: true

end