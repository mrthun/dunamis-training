class Credential < ActiveRecord::Base
  belongs_to :registrant, :polymorphic => true
end



# == Schema Information
#
# Table name: credentials
#
#  id                        :integer(4)      not null, primary key
#  registrant_id             :integer(4)
#  registrant_type           :string(255)
#  license_expiration_date   :datetime
#  insurance_expiration_date :datetime
#  health_exam_1_title       :text
#  health_exam_1_date        :datetime
#  health_exam_2_title       :text
#  health_exam_2_date        :datetime
#  created_at                :datetime
#  updated_at                :datetime
#

