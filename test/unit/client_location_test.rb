require 'test_helper'

class ClientLocationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: client_locations
#
#  id           :integer(4)      not null, primary key
#  client_id    :integer(4)
#  client_type  :string(255)
#  name         :string(255)
#  contact_name :string(255)
#  address_1    :text
#  address_2    :text
#  city         :string(255)
#  zip          :integer(4)
#  phone        :text
#  fax          :text
#  email        :text
#  created_at   :datetime
#  updated_at   :datetime
#

