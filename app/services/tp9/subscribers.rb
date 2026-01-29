# frozen_string_literal: true

class Tp9::Subscribers
  def send
    raise NotImplementedError, 'Subclasses must implement the send method'
  end
end
