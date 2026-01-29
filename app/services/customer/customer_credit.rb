# frozen_string_literal: true

class Customer::CustomerCredit < Customer::Customer
  def set_payment_method
    @attributes[:payment_method] = "credit"
  end

  def setOrder
    Order::OrderCredit.new(attributes: attributes)
  end
end
