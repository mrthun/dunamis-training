class Preference < ActiveRecord::Base
  belongs_to :registrant
  belongs_to :contract_type
end
