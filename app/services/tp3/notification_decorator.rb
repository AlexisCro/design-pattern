# frozen_string_literal: true

class Tp3::NotificationDecorator < Tp3::Notification
  attr_accessor :notification

  def initialize(notification)
    @notification = notification
  end

  def send_email
    "Email - "
  end

  def send_push
    "Push - "
  end

  def send_sms
    "SMS - "
  end
end
