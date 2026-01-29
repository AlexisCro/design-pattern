# frozen_string_literal: true

class Tp3::NotificationDeliveryDecorator < Tp3::NotificationDecorator
  def send_email
    super +  "Delivery - #{@notification}"
  end

  def send_push
    super + "Delivery - #{@notification}"
  end

  def send_sms
    super + "Delivery - #{@notification}"
  end
end
