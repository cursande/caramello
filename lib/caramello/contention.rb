module Caramello
  class Contention
    # If a contention is true, it does not raise so the test is a pass
    # TODO: refactor this to be a little more cohesive
    def initialize(value)
      @value = value
    end

    def to(matcher)
      raise(matcher.fail_message) unless matcher.is_correct?(@value)
    end
  end
end
