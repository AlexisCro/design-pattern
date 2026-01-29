# frozen_string_literal: true

module Tp1
  module DocumentBank
    class Document
      attr_accessor :attributes, :documents

      def initialize(attributes: {})
        @attributes = attributes

        @attributes[:documents] ||= []
        set_document
      end

      def set_document
        raise NotImplementedError, "Subclasses must implement the set_document method"
      end

      def get_documents
        @attributes[:documents]
      end
    end
  end
end
