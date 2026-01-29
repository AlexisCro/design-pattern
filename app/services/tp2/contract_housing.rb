# frozen_string_literal: true

class Tp2::ContractHousing < Tp2::Contract
  def validations
    super

    validate_presence_of(:address)
  end
end
