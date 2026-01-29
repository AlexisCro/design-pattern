# frozen_string_literal: true

module Tp5::Proxy
  extend ActiveSupport::Concern

  included do
    def logged_send
      puts "Logging message send action..."
      send
    end
  end
end
