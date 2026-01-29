# frozen_string_literal: true

module Order
  class Order
    include Builder

    attr_accessor :attributes

    def initialize(attributes:)
      @attributes = attributes

      @attributes[:order] ||= {}

      createOrder
    end

    def createOrder
      raise NotImplementedError, "Subclasses must implement the createOrder method"
    end
  end
end
