class CartItem < ActiveRecord::Base
  attr_accessible :beer_id, :quantity # cart_id
  
  belongs_to :beer
  belongs_to :cart
  
  def full_price
    number_to_currency(Beer.find_by_id(self.beer_id) * quantity)
  end
  
end
