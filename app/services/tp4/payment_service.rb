# frozen_string_literal: true

class Tp4::PaymentService
  attr_reader   :transaction_id, :state
  attr_accessor :amount, :currency

  def initialize(amount, currency)
    @amount         = amount
    @currency       = currency
    @transaction_id = Time.now.to_i
    @state          = 'initialized'
  end

  def process_payment(amount, currency)
    "Processing payment of #{@amount} #{@currency} via Tp4 Gateway."
    @state = "processed"
  end

  def refund_payment
    "Refunding payment of #{@amount} #{@currency} via Tp4 Gateway."
    @state = "refunded"
  end

  def get_transaction_status
    @state
  end
end
