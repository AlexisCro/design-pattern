# frozen_string_literal: true

class AbstractFactory::SMS < AbstractFactory::Notification
  def send_notification
    puts "Envoi SMS à #{@recipient}: #{@message}"
  end

  def connection
    puts 'Connexion API SMS...'
  end

  def logout
    puts 'Deconnexion API...'
  end
end
