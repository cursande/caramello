module Caramello
  class Contention

    # Raised when an it block does not not meet the set condition
    class ConditionNotMetError < StandardError; end

    # To avoid weird errors further on, we prevent invalid matchers
    # being passed in
    class InvalidMatcherError < StandardError; end

    def initialize(value)
      @value = value
    end

    def to(matcher)
      valid_matcher?(matcher)
      return true if matcher.condition_met?(@value)

      raise ConditionNotMetError, matcher.fail_message
    end

    private

    def valid_matcher?(matcher)
      # TODO: Make this nicer
      Matcher.constants.each do |klass|
        return if matcher.instance_of?(Matcher.const_get(klass))
      end

      raise InvalidMatcherError, 'Matcher not recognised'
    end
  end
end
