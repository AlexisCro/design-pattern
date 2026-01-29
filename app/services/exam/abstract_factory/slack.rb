# frozen_string_literal: true

class AbstractFactory::Slack < AbstractFactory::Notification
  def send_notification
    puts "Envoi Slack à #{@recipient}: #{@message}"
  end

  def connection
    puts 'Connexion API Slack...'
  end

  def logout
    puts 'Deconnexion Slack...'
  end
end
