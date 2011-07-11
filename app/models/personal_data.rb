class PersonalData < ActiveRecord::Base
  belongs_to :registrant
end

# == Schema Information
#
# Table name: personal_data
#
#  id                     :integer(4)      not null, primary key
#  registrant_id          :integer(4)
#  registrant_type        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  birth_date             :datetime
#  home_address_1         :text
#  home_address_2         :text
#  city                   :string(255)
#  zip                    :integer(4)
#  home_phone             :text
#  cell_phone             :text
#  hire_date              :datetime
#  social_security_number :integer(4)
#  bank                   :string(255)
#  account_number         :text
#  routing_number         :text
#  created_at             :datetime
#  updated_at             :datetime
#

