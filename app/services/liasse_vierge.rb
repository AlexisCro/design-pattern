# frozen_string_literal: true

class LiasseVierge
  include Singleton

  attr_accessor :documents

  def initialize(documents = [])
    @documents = documents
  end

  def add_document(document)
    @documents << document
  end

  def clear_documents
    @documents.clear
  end
end
