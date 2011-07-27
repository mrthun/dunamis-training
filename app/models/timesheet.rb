class Timesheet < ActiveRecord::Base

  belongs_to :creator, :polymorphic => true
  belongs_to :client, :polymorphic => true
  belongs_to :registrant, :polymorphic => true

  has_many :timesheet_entries, :dependent => :destroy
  has_many :timesheet_images, :dependent => :destroy

end
