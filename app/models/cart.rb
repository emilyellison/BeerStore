class Cart < ActiveRecord::Base
  attr_accessible # :user_id
  
  belongs_to :user
  has_one :order
  has_many :cart_items
  
  def total_price
    cart_items = CartItem.find_all_by_cart_id(id)
    beer_prices = cart_items.collect { |cart_item| cart_item.beer.price }
    beer_total = beer_prices.sum
    total_price = beer_total * 1.1
  end
  
end
