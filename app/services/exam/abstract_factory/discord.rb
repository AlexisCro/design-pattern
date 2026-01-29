# frozen_string_literal: true

class AbstractFactory::Discord < AbstractFactory::Notification
  def send_notification
    puts "Envoi Discord à #{@recipient}: #{@message}"
  end

  def connection
    puts 'Connexion API Discord...'
  end

  def logout
    puts 'Deconnexion Discord...'
  end
end
