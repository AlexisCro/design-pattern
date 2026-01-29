# frozen_string_literal: true

class Customer::CustomerCash < Customer::Customer
  def set_payment_method
    @attributes[:payment_method] = "cash"
  end

  def setOrder
    Order::OrderCash.new(attributes: @attributes)
  end
end
