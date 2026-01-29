# frozen_string_literal: true

class Decorator::SugarDecorator < Decorator::DecoratorAbstract
  def initialize(coffee)
    @coffee = coffee
    @sugar_cost = 0.3
    @sugar_description = ' with Sugar'
  end

  def cost
    @coffee.cost + @sugar_cost
  end

  def description
    @coffee.description + @sugar_description
  end
end
