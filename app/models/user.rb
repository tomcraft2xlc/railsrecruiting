# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  remember_token_user :string(255)
#  uid                 :string(255)
#  provider            :string(255)
#  oauth_token         :string(255)
#  oauth_expires_at    :datetime
#

class User < ActiveRecord::Base
	attr_accessible	:name, :email, :password, :password_confirmation

	has_secure_password
	validates_uniqueness_of :email

	before_create { generate_token(:remember_token_user) }

	#private
	#def create_remember_token
	#	self.remember_token = SecureRandom.urlsafe_base64
	#end

	def generate_token(column)
    	begin
      		self[column] = SecureRandom.urlsafe_base64
    	end while User.exists?(column => self[column])
  	end

  	#def self.from_omniauth(auth)
    #	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    #  	user.provider = auth.provider
    #  	user.uid = auth.uid
    #  	user.name = auth.info.name
    #  	user.oauth_token = auth.credentials.token
    #  	user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    #  	user.save!
    #end
  #end
end
