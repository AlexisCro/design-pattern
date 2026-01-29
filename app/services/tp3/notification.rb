# frozen_string_literal: true

class Tp3::Notification
  def send_email
    raise NotImplementedError, "Subclasses must implement the send_email method"
  end

  def send_push
    raise NotImplementedError, "Subclasses must implement the send_email method"
  end

  def send_sms
    raise NotImplementedError, "Subclasses must implement the send_email method"
  end
end
