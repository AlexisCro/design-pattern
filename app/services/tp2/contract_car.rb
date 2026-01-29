# frozen_string_literal: true

class Tp2::ContractCar < Tp2::Contract
  def validations
    super

    validate_presence_of(:registration)
  end
end
