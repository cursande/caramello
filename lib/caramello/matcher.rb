module Caramello
  # Tried to be clever with the name, but this is what most other test
  # frameworks seem to call it
  module Matcher

    # TODO: Muliple matcher classes will comprise the matcher module. This file
    # will end up just being a place to pull in these separate classes

    # usage: contend(a).will equal(b)
    class MatchEquality
      def initialize(a)
        @a = a
      end

      def equal(b)
        @b = b
        @b == @a
      end

      # Maybe even something like "#{@a} did not equal #{@b}"?
      def fail_message
        "Contention: #{@b.inspect} \n
         Result: #{@a.inspect}"
      end
    end
  end
end
