# frozen_string_literal: true

require 'caramello/version'

module Caramello
  %w[
      cli
      dsl
      formatter
      runner
      contention
      matcher
      test_case
      context
      logger
      formatter
      counter
    ].each { |lib| require_relative "./caramello/#{lib}" }

  class << self
    def test_behaviour(desc, &block)
      contexts.push(Context.setup(desc, &block))
    end

    def formatter
      @formatter ||= Formatter.new(logger)
    end

    def logger
      @logger ||= Logger.new
    end

    def run(counter)
      contexts.each { |cxt| cxt.run(counter) }
    end

    private

    def contexts
      @contexts ||= []
    end
  end
end
