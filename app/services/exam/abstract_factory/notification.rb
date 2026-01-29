# frozen_string_literal: true

class AbstractFactory::Notification
  def initialize(message, recipient)
    @message   = message
    @recipient = recipient
  end

  def send_notification
    raise NotImplementedError, 'You must implement the send_notification method'
  end

  def connection
    raise NotImplementedError, 'You must implement the connection method'
  end

  def logout
    raise NotImplementedError, 'You must implement the deconnection method'
  end

  def call
    connection
    send_notification
    logout
  end
end
