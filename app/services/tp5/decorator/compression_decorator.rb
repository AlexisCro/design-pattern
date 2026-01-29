# frozen_string_literal: true

class Tp5::Decorator::CompressionDecorator < Tp5::Decorator::Decorator
  def send
    puts "Compressing message..."
    @content += "Compressed message : " + @message.content
  end
end
