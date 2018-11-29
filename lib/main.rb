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
    ].each { |lib| require_relative "./caramello/#{lib}" }
end
