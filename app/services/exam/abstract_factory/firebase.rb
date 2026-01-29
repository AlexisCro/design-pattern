# frozen_string_literal: true

class AbstractFactory::Firebase < AbstractFactory::Notification
  def send_notification
    puts "Envoi notification push à #{@recipient}: #{@message}"
  end

  def connection
    puts 'Connexion Firebase...'
  end

  def logout
    puts 'Deconnexion Firebase...'
  end
end
