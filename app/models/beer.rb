class Beer < ActiveRecord::Base
  attr_accessible :name, :price # user_id
  
  belongs_to :user
  
  validates :name, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  
end
