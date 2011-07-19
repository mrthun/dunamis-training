class Job < ActiveRecord::Base

  belongs_to :creator
  belongs_to :client
  belongs_to :registrant

end
