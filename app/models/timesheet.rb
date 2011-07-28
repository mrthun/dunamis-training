class Timesheet < ActiveRecord::Base

  belongs_to :creator, :polymorphic => true
  belongs_to :client, :polymorphic => true
  belongs_to :registrant, :polymorphic => true

  has_many :timesheet_entries, :dependent => :destroy
  has_many :timesheet_images, :dependent => :destroy

end

# == Schema Information
#
# Table name: timesheets
#
#  id              :integer(4)      not null, primary key
#  creator_id      :integer(4)
#  creator_type    :string(255)
#  client_id       :integer(4)
#  client_type     :string(255)
#  registrant_id   :integer(4)
#  registrant_type :string(255)
#  facility        :text
#  status          :string(255)
#  end_of_week     :datetime
#  total_hours     :text
#  created_at      :datetime
#  updated_at      :datetime
#

