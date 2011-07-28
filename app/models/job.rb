class Job < ActiveRecord::Base

  belongs_to :creator, :polymorphic => true
  belongs_to :client, :polymorphic => true
  belongs_to :registrant, :polymorphic => true

end



# == Schema Information
#
# Table name: jobs
#
#  id              :integer(4)      not null, primary key
#  creator_id      :integer(4)
#  creator_type    :string(255)
#  client_id       :integer(4)
#  client_type     :string(255)
#  registrant_id   :integer(4)
#  registrant_type :string(255)
#  facility        :text
#  date            :datetime
#  hours           :integer(4)
#  location        :text
#  payroll_status  :string(255)
#  invoice_status  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

