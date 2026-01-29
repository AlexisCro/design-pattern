# frozen_string_literal: true

class Decorator::DecoratorAbstract
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    raise NotImplementedError, 'You must implement the cost method'
  end

  def description
    raise NotImplementedError, 'You must implement the description method'
  end
end
