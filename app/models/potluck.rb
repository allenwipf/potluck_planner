class Potluck < ActiveRecord::Base
	has_many :items  #, dependent :destroy
	belongs_to :user

	validates :title, presence: true
	validates :location, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :user_id, presence: true


  def authorized_user(id)
		if self.user_id == id
			return true
		end
	end
end