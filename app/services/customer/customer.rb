# frozen_string_literal: true

module Customer
  class Customer
    include Builder

    CREDITABLE_LIMIT = 500.freeze

    attr_accessor :attributes

    def initialize(attributes: {})
      @attributes = attributes

      validate_creditable

      set_payment_method
      setOrder
    end

    def set_payment_method
      raise NotImplementedError, 'Subclasses must implement the set_payment_method method'
    end

    def setOrder
      raise NotImplementedError, 'Subclasses must implement the setOrder method'
    end

    def is_creditable?
      false if @attributes[:price] < CREDITABLE_LIMIT

      true
    end

    def validate_creditable
      raise "Customer is not creditable" unless is_creditable? && !self.is_a?(CustomerCredit)
    end
  end
end
