class BillingData < ActiveRecord::Base
  belongs_to :client, :class_name => "User", :foreign_key => 'client_id'
  belongs_to :pay_type
end

# == Schema Information
#
# Table name: billing_data
#
#  id                :integer(4)      not null, primary key
#  client_id         :integer(4)
#  client_type       :string(255)
#  preferred_bill_in :string(255)
#  pay_term          :string(255)
#  week_start        :string(255)
#  week_end          :string(255)
#  over_time         :string(255)
#  lunch_rule        :integer(4)
#  lunch_break       :integer(4)
#  time_rounding     :integer(4)
#  pay_type_id       :integer(4)
#  credit_line       :integer(4)
#  interest           :integer(4)
#  charge_interest    :boolean(1)
#  created_at        :datetime
#  updated_at        :datetime
#

