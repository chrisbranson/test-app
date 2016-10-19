class User < ActiveRecord::Base
	has_many :microposts, :dependent => :delete_all

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, length: { minimum: 6 }

	has_secure_password
end
