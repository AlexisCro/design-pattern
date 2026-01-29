# frozen_string_literal: true

class Order::OrderCredit < Order::Order
  def createOrder
    @attributes[:order][:paid] = false
  end
end
