# frozen_string_literal: true

class Tp1::DocumentBank::CustomerParticular < Tp1::DocumentBank::Customer
  def set_siren
    @attributes[:siren] = ""
  end

  def get_siren
    "This is a particular customer, no SIREN available"
  end
end
