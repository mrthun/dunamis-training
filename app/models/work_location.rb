class WorkLocation < ActiveRecord::Base
  belongs_to :registrant, :class_name => "User", :foreign_key => 'registrant_id'
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
#  do_not_schedual      :boolean(1)
#  comment              :text
#  created_at           :datetime
#  updated_at           :datetime
#

