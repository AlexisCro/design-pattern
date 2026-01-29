# frozen_string_literal: true

class Composite::Composite
  def initialize
    @children = []
  end

  def add(component)
    @children << component
    component.parent = self
  end

  def get_child
    @children
  end

  def remove(component)
    @children.delete(component)
    component.parent = nil
  end

  def operation
    results = []

    @children.each do |child|
      results << child.operation
    end

    "Composite(#{results.join('+')})"
  end
end
