class Pay < ActiveRecord::Base
  belongs_to :registrant
  belongs_to :pay_type
end
