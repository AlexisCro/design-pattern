# frozen_string_literal: true

class Tp4::PaymentPro
  def initialize(amount, code_devise)
    @amount         = amount
    @code_devise    = code_devise
    @transaction_id = Time.now.to_i
    @state          = 'initialized'
  end

  def execute_transaction(amount, code_devise)
    "Executing transaction of #{@amount} #{@code_devise} via Tp4 Pro Gateway."
    @state = "executed"
  end

  def cancel_transaction
    "Cancelling transaction of #{@amount} #{@code_devise} via Tp4 Pro Gateway."
    @state = "cancelled"
  end

  def get_state
    @state
  end
end
