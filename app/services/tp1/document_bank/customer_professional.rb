# frozen_string_literal: true

class Tp1::DocumentBank::CustomerProfessional < Tp1::DocumentBank::Customer
  def set_siren
    @attributes[:siren] = rand(10**8..10**9 - 1).to_s
  end

  def get_siren
    @attributes[:siren]
  end
end
