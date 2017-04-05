class User < ActiveRecord::Base
	has_many :potlucks

	validates :name, presence: true
	validates :email, presence: true,  uniqueness: { case_sensitive: false },
					  format:     { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

end
