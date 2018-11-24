module Caramello
  class TestCase
    def initialize(desc, &block)
      @desc = desc
      @block = block
    end

    def run(dsl)
      dsl.instance_eval(&@block)
    rescue ConditionNotMetError => fail_message
      {
        pass: false,
        message: fail_message
      }
    end
  end
end
