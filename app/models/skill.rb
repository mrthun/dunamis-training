class Skill < ActiveRecord::Base
  belongs_to :registrant
  belongs_to :occupation_type
end
