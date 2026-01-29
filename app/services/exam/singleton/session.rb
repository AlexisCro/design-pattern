# frozen_string_literal: true

class Session
  include Singleton

  def initialize
    @data ||= {}
  end

  def set(key, value)
    @data[key] = value
  end

  def get(key)
    @data[key]
  end

  def clear
    @data.clear
  end

  def get_session
    @data
  end
end
