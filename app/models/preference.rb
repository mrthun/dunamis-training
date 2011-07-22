class Preference < ActiveRecord::Base
  belongs_to :registrant, :polymorphic => true
  belongs_to :contract_type
end


# == Schema Information
#
# Table name: preferences
#
#  id                   :integer(4)      not null, primary key
#  registrant_id        :integer(4)
#  registrant_type      :string(255)
#  work_on_weekends     :boolean(1)
#  work_after_hours     :boolean(1)
#  max_driving_distance :integer(4)
#  contract_type_id     :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

