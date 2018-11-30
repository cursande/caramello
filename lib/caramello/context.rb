require 'pry'

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

    # TODO: How can I achieve this if I move test_case over to the Dsl class?
    # Is there a way I can populate @test_cases while still calling test_case
    # from Dsl?
    def test_case(desc, &block)
      @test_cases.push(Dsl.test_case(desc, &block))
    end

    attr_reader :desc

    def run
      @test_cases.each do |test_case|
        result = test_case.run
        puts test_case.desc + ' => ' +  (result.fetch(:pass) ? 'pass' : result.fetch(:fail_message))
      end
      @children.each(&:run)
    end
  end
end
