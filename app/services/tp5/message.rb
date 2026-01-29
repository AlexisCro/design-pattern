# frozen_string_literal: true

class Tp5::Message
  attr_reader :content

  include Tp5::Proxy

  def initialize(content)
    @content = content
  end

  def send
    puts @content
  end
end
