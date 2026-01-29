# frozen_string_literal: true

class Tp2::ContractLife < Tp2::Contract
  def validations
    super

    validate_presence_of(:age)
  end
end
