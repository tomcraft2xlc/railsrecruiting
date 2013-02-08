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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
