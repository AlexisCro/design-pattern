# frozen_string_literal: true

class AbstractFactory::SMTP < AbstractFactory::Notification
  def send_notification
    "Envoi email à #{@recipient}: #{@message}"
  end

  def connection
    "Connexion au serveur SMTP..."
  end

  def logout
    "Déconnexion du serveur SMTP"
  end
end
