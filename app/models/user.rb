class User < ActiveRecord::Base
	before_create :create_remember_token
	before_save { self.email = email.downcase }

	has_many :microposts, :dependent => :delete_all

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	default_scope -> { order('name ASC') }

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	has_secure_password

	def self.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
  	self.remember_token = User.digest(User.new_remember_token)
  end
end
