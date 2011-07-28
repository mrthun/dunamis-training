class TimesheetEntry < ActiveRecord::Base

  belongs_to :timesheet
  
end

# == Schema Information
#
# Table name: timesheet_entries
#
#  id           :integer(4)      not null, primary key
#  timesheet_id :integer(4)
#  day          :string(255)
#  break_start  :text
#  break_end    :text
#  time_in      :text
#  time_out     :text
#  hours        :text
#  created_at   :datetime
#  updated_at   :datetime
#

