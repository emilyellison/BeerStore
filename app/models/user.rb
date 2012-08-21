class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :beers
  has_one :cart
  has_many :cart_items, through: :cart
  
  before_save { |user| user.email = email.downcase }
  after_create :create_cart
  
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  def create_cart
    cart = Cart.new
    cart.user_id = self.id
    cart.save
  end
  
end
