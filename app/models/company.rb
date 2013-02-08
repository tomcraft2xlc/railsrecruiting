# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  city                   :string(255)
#  street                 :string(255)
#  number                 :integer
#  cap                    :integer
#  link                   :string(255)
#  description            :text
#  funded                 :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

class Company < ActiveRecord::Base
	attr_accessible	:name, :email, :city, :street, :number, :cap, :link, 
	                :description, :funded, :password, :password_confirmation


	has_secure_password
	has_many :jobs

	validates_uniqueness_of :email

	#before_save :create_remember_token
	before_create { generate_token(:remember_token) }

	#private
	#def create_remember_token
	#	self.remember_token = SecureRandom.urlsafe_base64
	#end

	def generate_token(column)
    	begin
      		self[column] = SecureRandom.urlsafe_base64
    	end while Company.exists?(column => self[column])
  	end

  	def send_password_reset
  		generate_token(:password_reset_token)
  		self.password_reset_sent_at = Time.zone.now
  		save!
  		CompanyMailer.password_reset(self).deliver
	end
end
