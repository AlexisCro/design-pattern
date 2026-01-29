# frozen_string_literal: true

class Tp5::Decorator::Decorator
  attr_accessor :content

  include Tp5::Proxy

  def initialize(message)
    @message = message
    @content = @message.content
  end

  def send
    raise NotImplementedError, 'You must implement the send method'
  end
end
