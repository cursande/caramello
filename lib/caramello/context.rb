module Caramello
  class Context
    # allows for nested contexts
    def self.setup(description, parent = nil, &block)
      context = new(description, parent, &block)
      parent.children.push(context) if parent
      Dsl.class_eval(&block)
      context
    end

    def initialize(description, parent = nil, &block)
      @description = description
      @parent = parent
      @block = block
      @children = []
      @test_cases = []
    end

    def test_case(desc, &block)
      TestCase.new(desc, &block)
    end

    def run
      # NOTE How to manage @test_cases where Dsl is a bunch of class methods??
      @test_cases.each do |test_case|
        result = test_case.run(Dsl.class_eval(&@block))
        print test_case.desc + ' => ' +  (result.fetch(:pass) ? 'pass' : 'fail')
      end
      @children.each(&:run)
    end
  end
end
