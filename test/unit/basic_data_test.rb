require 'test_helper'

class BasicDataTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: basic_data
#
#  id             :integer(4)      not null, primary key
#  client_id      :integer(4)
#  client_type    :string(255)
#  name           :text
#  comment        :string(255)
#  client_type_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

