class ClientType < ActiveRecord::Base
  has_many :basic_data, :dependent => :destroy
end
