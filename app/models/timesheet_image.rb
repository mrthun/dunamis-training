class TimesheetImage < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb => "200x100>"}
  belongs_to :timesheet

end

# == Schema Information
#
# Table name: timesheet_images
#
#  id                 :integer(4)      not null, primary key
#  timesheet_id       :integer(4)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

