class PayType < ActiveRecord::Base
  has_many :pays, :dependent => :destroy
  has_many :billing_datas, :dependent => :destroy
  
end
