class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_type, :cart_id, :first_name, :ip_address, :last_name
  attr_accessor :card_number, :card_verification
  
end
