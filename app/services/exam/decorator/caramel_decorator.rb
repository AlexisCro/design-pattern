# frozen_string_literal: true

class Decorator::CaramelDecorator < Decorator::DecoratorAbstract
  def initialize(coffee)
    @coffee = coffee
    @caramel_cost = 0.7
    @caramel_description = ' with Caramel'
  end

  def cost
    @coffee.cost + @caramel_cost
  end

  def description
    @coffee.description + @caramel_description
  end
end
