# frozen_string_literal: true

class Tp9::Stock < Tp9::Observer
  attr_reader :price, :name

  def initialize
    super

    @price = 0
    @name  = ''
  end

  def update_price(price)
    @price = price

    notify_all
  end

  def update_name(name)
    @name = name

    notify(@subscribers.first)
  end
end
