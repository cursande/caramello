# frozen_string_literal: true

require 'caramello/version'

module Caramello
  %w[
      dsl
      formatter
      runner
      option_parser
      contention
      matcher
      test_case
      context
      formatter
    ].each { |lib| require_relative "./caramello/#{lib}" }

  class << self
    def test_behaviour(desc, &block)
      @contexts.push(Context.setup(desc, &block))
    end

    def run
      contexts.each(&:run)
    end

    private

    def contexts
      @contexts ||= []
    end
  end
end
