# frozen_string_literal: true

class Tp4::Adapter < Tp4::PaymentService
  STATE = {
    '1': 'initialized',
    '2': 'processed',
    '3': 'refunded'
  }.freeze

  CURRENCY = {
    '1': "EUR",
    '2': "USD",
    '3': "GBP"
  }.freeze

  def initialize(adaptee)
    @adaptee = adaptee
  end

  def process_payment(amount, currency)
    @adaptee.execute_transaction(amount, CURRENCY.key(currency).to_s)
  end

  def refund_payment
    @adaptee.cancel_transaction
  end

  def get_transaction_status
    STATE[@adaptee.get_state.to_s]
  end
end
