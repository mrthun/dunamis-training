class ContractType < ActiveRecord::Base
  has_many :preferences, :dependent => :destroy
end
