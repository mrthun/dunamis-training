require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end




# == Schema Information
#
# Table name: preferences
#
#  id                   :integer(4)      not null, primary key
#  registrant_id        :integer(4)
#  registrant_type      :string(255)
#  work_on_weekends     :boolean(1)
#  work_after_hours     :boolean(1)
#  max_driving_distance :integer(4)
#  contract_type_id     :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

