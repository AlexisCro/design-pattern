# frozen_string_literal: true

class Order::OrderCash < Order::Order
  def createOrder
    @attributes[:order][:paid] = true
  end
end
