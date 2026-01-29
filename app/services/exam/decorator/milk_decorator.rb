# frozen_string_literal: true

class Decorator::MilkDecorator < Decorator::DecoratorAbstract
  def initialize(coffee)
    @coffee = coffee
    @milk_cost = 0.5
    @milk_description = ' with Milk'
  end

  def cost
    @coffee.cost + @milk_cost
  end

  def description
    @coffee.description + @milk_description
  end
end
