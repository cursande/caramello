module Caramello
  module Matcher
    # TODO: Muliple matcher classes will comprise the matcher module. This file
    # will end up just being a place to pull in these separate classes

    # usage: contend(a).will equal(b)
    class MatchEquality
      def initialize(a)
        @a = a
      end

      def condition_met?(b)
        @b = b
        @b == @a
      end

      def fail_message
        "Predicted: #{@a.inspect}\nResult: #{@b.inspect}"
      end
    end
  end
end
