# frozen_string_literal: true

class Tp2::Contract
  attr_accessor :attributes, :contracts

  def initialize(attributes: {})
    @attributes = attributes

    @attributes[:version] = 1

    @contracts ||= []

    validations
    set_version
    @contracts << self
  end

  def set_version
    @attributes[:name_version] = self.class.name.delete_prefix(self.class.module_parent.name + "::").downcase + "_v#{Time.now.to_i}_#{@attributes[:version]}"
  end

  def validations
    validate_presence_of(:start_date)
    validate_presence_of(:end_date)
    validate_presence_of(:amount)
    validate_presence_of(:customer_name)
  end

  def validate_presence_of(attribute)
    raise "#{attribute} is required" if @attributes[attribute].nil?
  end

  def update(params)
    raise "params can't be blank" if params.blank?

    params.each do |key, value|
      @attributes[key] = value
    end

    @attributes[:version] = @attributes[:version].to_i + 1
    set_version
  end

  def duplicate
    @attributes = self.attributes.deep_dup
    klass = self.class

    klass.new(attributes: @attributes)
  end

  def get_version
    @attributes[:version]
  end

  private

  def find_contract_by_version(version)
    @contracts.find { |c| c.attributes[:version] == version }
  end
end
