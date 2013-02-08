# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  company_id         :string(255)
#  address            :string(255)
#  latitude           :float
#  longitude          :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  jobDescription     :text
#  companyDescription :text
#  desiredSkills      :text
#

class Job < ActiveRecord::Base
	attr_accessible :title, :address, :jobDescription, :companyDescription
	belongs_to :company

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
