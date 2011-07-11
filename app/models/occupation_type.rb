class OccupationType < ActiveRecord::Base
  has_one :skills, :dependent => :destroy
end
