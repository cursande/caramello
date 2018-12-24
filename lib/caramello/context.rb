module Caramello
  class Context
    # allows for nested contexts
    def self.setup(description, parent = nil, &block)
      context = new(description, parent, &block)
      parent.children.push(context) if parent
      context.instance_eval(&block)
      context
    end

    def initialize(description, parent = nil, &block)
      @description = description
      @parent = parent
      @block = block
      @children = []
      @test_cases = []
    end

    # Delegating to Dsl for now
    def test_case(desc, &block)
      @test_cases.push(Dsl.test_case(desc, &block))
    end

    attr_reader :desc

    def run
      @test_cases.each do |test_case|
        result = test_case.run
        Caramello.formatter.record(test_case, result)
      end
      @children.each(&:run)
    end
  end
end
