module Caramello
  class TestCase
    def initialize(desc, &block)
      @desc = desc
      @block = block
    end

    def run
      Caramello::Dsl.class_eval(&@block)
      { pass: true }
    rescue Contention::ConditionNotMetError => test_failure
      {
        pass: false,
        fail_message: test_failure.message
      }
    end
  end
end
