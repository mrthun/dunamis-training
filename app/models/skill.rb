class Skill < ActiveRecord::Base
  belongs_to :registrant
  belongs_to :occupation_type
end

# == Schema Information
#
# Table name: skills
#
#  id                 :integer(4)      not null, primary key
#  registrant_id      :integer(4)
#  registrant_type    :string(255)
#  occupation_type_id :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

