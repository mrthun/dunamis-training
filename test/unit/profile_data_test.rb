require 'test_helper'

class ProfileDataTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: profile_data
#
#  id             :integer(4)      not null, primary key
#  scheduler_id   :integer(4)
#  scheduler_type :string(255)
#  first_name     :string(255)
#  middle_name    :string(255)
#  last_name      :string(255)
#  birth_date     :datetime
#  home_address_1 :text
#  home_address_2 :text
#  city           :string(255)
#  zip            :integer(4)
#  home_phone     :text
#  cell_phone     :text
#  created_at     :datetime
#  updated_at     :datetime
#

