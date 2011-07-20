class Job < ActiveRecord::Base

  belongs_to :creator, :polymorphic => true
  belongs_to :client, :polymorphic => true
  belongs_to :registrant, :polymorphic => true

end
