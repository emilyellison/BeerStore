class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_type, :cart_id, :first_name, :ip_address, :last_name, :card_number, :card_verification
  attr_accessor :card_number, :card_verification
  
  before_validation :validate_card, :on => :create
  
  private

    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
      )
    end

    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors[:base] << message
        end
      end
    end


  
end
