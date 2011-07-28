require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: timesheets
#
#  id              :integer(4)      not null, primary key
#  creator_id      :integer(4)
#  creator_type    :string(255)
#  client_id       :integer(4)
#  client_type     :string(255)
#  registrant_id   :integer(4)
#  registrant_type :string(255)
#  facility        :text
#  status          :string(255)
#  end_of_week     :datetime
#  total_hours     :text
#  created_at      :datetime
#  updated_at      :datetime
#

