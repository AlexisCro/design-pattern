# frozen_string_literal: true

class Tp3::NotificationSupportDecorator < Tp3::NotificationDecorator
  def send_email
    super + "Support - #{@notification}"
  end

  def send_push
    super + "Support - #{@notification}"
  end

  def send_sms
    super + "Support - #{@notification}"
  end
end
