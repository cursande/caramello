require 'pry'

module Caramello
  class Contention

    # Raised when an it block does not not meet the set condition.
    class ConditionNotMetError < StandardError; end

    def initialize(value)
      @value = value
    end

    def to(matcher)
      return if matcher.condition_met?(@value)

      raise ConditionNotMetError, matcher.fail_message
    end
  end
end
