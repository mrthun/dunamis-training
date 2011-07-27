class TimesheetImage < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb => "200x100>"}
  belongs_to :timesheet

end
