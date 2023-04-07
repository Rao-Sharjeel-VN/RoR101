class Chef < ApplicationRecord
	
	before_save { self.email = email.downcase}
	validates :chefname, presence: true
	VALID_EMAIL_REGEX = /\A(\S+)@(.+)\.(\S+)\z/
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	has_many :recipes
	has_secure_password

	validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
end	