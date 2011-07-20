class WorkLocation < ActiveRecord::Base
  belongs_to :registrant, :polymorphic => true
end

# == Schema Information
#
# Table name: work_locations
#
#  id                   :integer(4)      not null, primary key
#  registrant_id        :integer(4)
#  registrant_type      :string(255)
#  name                 :string(255)
#  first_worked         :string(255)
#  received_orientation :datetime
#  do_not_schedule      :boolean(1)
#  comment              :text
#  created_at           :datetime
#  updated_at           :datetime
#

