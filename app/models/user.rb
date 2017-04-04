class User < ActiveRecord::Base
	has_many :potlucks

	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true
end
