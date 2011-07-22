class Address < ActiveRecord::Base
  belongs_to :client, :polymorphic => true
end


# == Schema Information
#
# Table name: addresses
#
#  id                    :integer(4)      not null, primary key
#  client_id             :integer(4)
#  client_type           :string(255)
#  billing_contact_name  :string(255)
#  billing_address_1     :text
#  billing_address_2     :text
#  billing_city          :string(255)
#  billing_zip           :integer(4)
#  billing_phone         :text
#  billing_fax           :text
#  billing_email         :text
#  location_contact_name :string(255)
#  location_address_1    :text
#  location_address_2    :text
#  location_city         :string(255)
#  location_zip          :integer(4)
#  location_phone        :text
#  location_fax          :text
#  location_email        :text
#  created_at            :datetime
#  updated_at            :datetime
#

