# frozen_string_literal: true

class Tp3::NotificationDiscordDecorator < Tp3::NotificationDecorator
  def send_email
    super + "Discord - #{@notification}"
  end

  def send_push
    super + "Discord - #{@notification}"
  end

  def send_sms
    super + "Discord - #{@notification}"
  end
end
