class Beer < ActiveRecord::Base
  attr_accessible :name, :price
  
  validates :name, presence: true
  validates :price, presence: true
  
end
