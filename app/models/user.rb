class User < ActiveRecord::Base
	has_many :potlucks

	validates :name, presence: true
	validates :email, presence: true

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

end
