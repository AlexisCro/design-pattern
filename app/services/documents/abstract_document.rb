# frozen_string_literal: true

module Documents
  class AbstractDocument
    def display_informations
      raise NotImplementedError, 'Subclasses must implement the display_informations method'
    end
  end
end
