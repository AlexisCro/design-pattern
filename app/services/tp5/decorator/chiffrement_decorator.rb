# frozen_string_literal: true

class Tp5::Decorator::ChiffrementDecorator < Tp5::Decorator::Decorator
  def send
    puts "Encrypting message..."
    @content += "Encrypting message : " + @message.content
  end
end
