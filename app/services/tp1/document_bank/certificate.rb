# frozen_string_literal: true

class Tp1::DocumentBank::Certificate < Tp1::DocumentBank::Document
  def set_document
    if @attributes[:professional]
      @attributes[:documents] <<
        {
          type: "Certificate",
          terms_of_use: "Certificate Document with specific terms of use for professional customers"
        }
    else
      @attributes[:documents] <<
        {
          type: "Certificate",
          terms_of_use: ""
        }
    end
  end
end
