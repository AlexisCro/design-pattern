# frozen_string_literal: true

class Tp1::DocumentBank::Rib < Tp1::DocumentBank::Document
  def set_document
    @attributes[:documents] <<
      {
        type:           "RIB",
        IBAN:           "FR76#{rand(1000000000000000..9999999999999999)}",
        BIC:            "AGRIFRPPXXX",
        bank_name:      "AGRI BANK",
        bank_address:   "12 rue des banques, 75000 Paris",
        siren:          @attributes[:siren],
        account_holder: "#{@attributes[:first_name]} #{@attributes[:last_name]}"
      }
  end

  def get_RIB
    @attributes[:rib]
  end

end
