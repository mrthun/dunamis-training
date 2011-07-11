class BillingData < ActiveRecord::Base
  belongs_to :client
  belongs_to :pay_type
end
