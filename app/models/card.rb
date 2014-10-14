class Card < ActiveRecord::Base
  belongs_to :registration
  has_one :card_transaction

  # These attributes won't be stored
  attr_accessor :card_number, :card_verification

  before_create :validate_card

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    create_card_transaction(action: "purchase", amount: price_in_cents, response: response)
    registration.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    (registration.course.price*100).round
  end

  private

  def purchase_options
    {
        ip: ip_address,
        billing_address: {
            name:      "Flaying Cakes",
            address1:  "123 5th Av.",
            city:      "New York",
            state:     "NY",
            country:   "US",
            zip:       "10001"
        }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        type:                card_type,
        number:              card_number,
        verification_value:  card_verification,
        month:               card_expires_on.month,
        year:                card_expires_on.year,
        first_name:          first_name,
        last_name:           last_name
    )
  end
end
