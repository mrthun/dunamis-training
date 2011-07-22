class Pay < ActiveRecord::Base
  belongs_to :registrant, :polymorphic => true
  belongs_to :pay_type
end


# == Schema Information
#
# Table name: pays
#
#  id                  :integer(4)      not null, primary key
#  registrant_id       :integer(4)
#  registrant_type     :string(255)
#  regular_hours_from  :datetime
#  regular_hours_to    :datetime
#  overtime_hours_from :datetime
#  overtime_hours_to   :datetime
#  night_hours_from    :datetime
#  night_hours_to      :datetime
#  weekend_hours_from  :datetime
#  weekend_hours_to    :datetime
#  pay_type_id         :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#

