# frozen_string_literal: true

class Tp3::NotificationOrderDecorator < Tp3::NotificationDecorator
  def send_email
    super + "Order - #{@notification}"
  end

  def send_push
    super + "Order - #{@notification}"
  end

  def send_sms
    super + "Order - #{@notification}"
  end
end
