# frozen_string_literal: true

class Tp9::Graphical < Tp9::Subscribers
  def initialize
    @message = "Graphical Service: Stock price updated."
  end

  def send
    puts @message
  end
end
