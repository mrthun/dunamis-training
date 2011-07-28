require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: jobs
#
#  id              :integer(4)      not null, primary key
#  creator_id      :integer(4)
#  creator_type    :string(255)
#  client_id       :integer(4)
#  client_type     :string(255)
#  registrant_id   :integer(4)
#  registrant_type :string(255)
#  facility        :text
#  date            :datetime
#  hours           :integer(4)
#  location        :text
#  payroll_status  :string(255)
#  invoice_status  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

