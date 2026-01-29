# frozen_string_literal: true

class Tp9::Alerts < Tp9::Subscribers
  def initialize
    @message = "Alert Service: Stock price updated."
  end

  def send
    puts @message
  end
end
