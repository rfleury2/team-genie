class User < ActiveRecord::Base
	# Tasks
	before_create { generate_token(:auth_token) }

  # Associations
  

  # Validations
  has_secure_password
  validates :email, {
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }
  validates_length_of :password, minimum: 6, too_short: "Please enter a password that is a minimum of 6 characters"
	validates_confirmation_of :password

	validates_presence_of :name

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
