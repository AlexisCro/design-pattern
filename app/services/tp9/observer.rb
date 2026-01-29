# frozen_string_literal: true

class Tp9::Observer
  attr_accessor :subscribers

  def initialize
    @subscribers = []
  end

  def subscribe(service)
    @subscribers << service
  end

  def unsubscribe(service)
    @subscribers.delete(service)
  end

  def notify_all
    @subscribers.each do |service|
      notify(service)
    end
  end

  def notify(service)
    service.send
  end
end
