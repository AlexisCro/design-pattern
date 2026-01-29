# frozen_string_literal: true

module Tp1
  module DocumentBank
    class Customer
      attr_accessor :attributes

      def initialize(attributes: {})
        @attributes = attributes

        validations
        set_siren
        create_rib
        create_certificate
      end

      def set_siren
        raise NotImplementedError, "Subclasses must implement the set_siren method"
      end

      def get_siren
        raise NotImplementedError, "Subclasses must implement the get_siren method"
      end

      def create_rib
        Tp1::DocumentBank::Rib.new(attributes: @attributes)
      end

      def create_certificate
        Tp1::DocumentBank::Certificate.new(attributes: @attributes)
      end

      def get_documents
        @attributes[:documents]
      end

      def validations
        validate_presence_of(:professional)
      end

      private

      def validate_presence_of(attribute)
        raise "#{attribute} is required" if @attributes[attribute].nil?
      end
    end
  end
end
