# frozen_string_literal: true

class AbstractFactory::Whatsapp < AbstractFactory::Notification
  def send_notification
    puts "Envoi WhatsApp à #{@recipient}: #{@message}"
  end

  def connection
    puts 'Connexion API WhatsApp...'
  end

  def logout
    puts 'Deconnexion WhatsApp...'
  end
end
