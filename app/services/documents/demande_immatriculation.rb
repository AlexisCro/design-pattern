# frozen_string_literal: true

module Documents
  class DemandeImmatriculation
    def initialize(**kwargs)
      @attributes = kwargs
    end

    def display_informations
      @attributes.each do |key, value|
        puts "#{key.to_s.capitalize.gsub('_', ' ')}: #{value}"
      end
    end
  end
end
