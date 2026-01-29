# frozen_string_literal: true

class Composite::Component
  attr_accessor :parent

  def initialize
    @parent = nil
  end

  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
