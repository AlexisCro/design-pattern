# frozen_string_literal: true

# frozen_string_literal: true

class Tp5::Decorator::SignDecorator < Tp5::Decorator::Decorator
  def send
    puts "Signing message..."
    @content += "Sign message : " + @message.content
  end
end
