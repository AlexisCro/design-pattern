# frozen_string_literal: true

class Decorator::CoffeeAbstract
  def cost
    raise NotImplementedError, 'You must implement the cost method'
  end

  def description
    raise NotImplementedError, 'You must implement the description method'
  end
end
