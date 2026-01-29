# frozen_string_literal: true

class Decorator::Coffee < Decorator::CoffeeAbstract
  def initialize
    @cost = 2.0
    @description = 'Simple Coffee'
  end

  def cost
    @cost
  end

  def description
    @description
  end
end
