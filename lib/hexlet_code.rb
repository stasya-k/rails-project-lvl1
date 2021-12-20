# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  SINGLE_TAGS = %w[br hr img input].freeze
  # class to generate HTML tag
  class Tag
    class << self
      def build(tag, params = {})
        tag_params = build_params(params)

        return "<#{tag}#{tag_params}>#{yield}</#{tag}>" if block_given?

        if SINGLE_TAGS.include?(tag)
          "<#{tag}#{tag_params}>"
        else
          "<#{tag}#{tag_params}></#{tag}>"
        end
      end

      private

      def build_params(params)
        params.collect { |key, value| %( #{key}="#{value}") }.join
      end
    end
  end
end
