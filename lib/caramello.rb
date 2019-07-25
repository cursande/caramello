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

    def run(fail_count)
      contexts.each { |cxt| cxt.run(fail_count) }
    end

    private

    def contexts
      @contexts ||= []
    end
  end
end
