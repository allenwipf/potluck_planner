class Potluck < ActiveRecord::Base

	has_many :items
	belongs_to :user

	validates :title, presence: true
	validates :location, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :user_id, presence: true
	validates :slug, presence: true

	def slug
  		id.to_s + "-" + title.downcase.parameterize.gsub(" ", "-") 
  end

  def authorized_user(id)
		if self.user_id == id
			return true
		end
  end
end