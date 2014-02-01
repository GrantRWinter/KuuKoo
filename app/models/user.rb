class User < ActiveRecord::Base
	has_many :messages

	validates :first_name,
		presence: true

	validates :last_name,
		presence: true

	validates :email,
		presence: true

	validates :password_digest,
		presence: true

	validates :phone_number,
		presence: true

  	has_secure_password
  
end
