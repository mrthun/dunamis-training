class BasicData < ActiveRecord::Base
  belongs_to :client, :polymorphic => true
  belongs_to :facility_type
end




# == Schema Information
#
# Table name: basic_data
#
#  id               :integer(4)      not null, primary key
#  client_id        :integer(4)
#  client_type      :string(255)
#  name             :text
#  comment          :string(255)
#  facility_type_id :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

