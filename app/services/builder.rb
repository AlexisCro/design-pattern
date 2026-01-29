# frozen_string_literal: true

module Builder
  extend ActiveSupport::Concern

  included do
    include ActiveSupport::Callbacks

    define_callbacks :query_building
    define_callbacks :reset_query

    set_callback :query_building, :before, :initialize_query_parts
    set_callback :reset_query, :after, :reset_query_parts

    attr_accessor :query_parts

    def initialize_query_parts
      @query_parts ||= ""
    end

    def reset_query_parts
      @query_parts = ""
    end

    def select(*attributes)
      run_callbacks :query_building do
        attributes = attributes.empty? ? "*" : attributes.join(', ')

        @query_parts += "SELECT #{attributes} FROM #{self.class.name} "
      end

      self
    end

    def where(**conditions)
      run_callbacks :query_building do
        condition_strings = conditions.map do |key, value|
          formatted_value = value.is_a?(String) ? "'#{value}'" : value
          "#{key} = #{formatted_value}"
        end

        @query_parts += "WHERE " + build_condition_string(conditions) + " "
      end

      self
    end

    def or(**conditions)
      run_callbacks :query_building do
        @query_parts += "OR (" + build_condition_string(conditions) + ") "
      end

      self
    end

    def limit(number)
      run_callbacks :query_building do
        @query_parts += "LIMIT #{number} "
      end

      self
    end

    def to_sql
      run_callbacks :reset_query do
        @query_parts += ";"
      end
    end

    private

    def build_condition_string(conditions)
      conditions.map do |key, value|
        formatted_value = value.is_a?(String) ? "'#{value}'" : value
        "#{key} = #{formatted_value}"
      end.join(' AND ')
    end
  end
end
