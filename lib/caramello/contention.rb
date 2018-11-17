module Caramello
  module Contention
    # TODO: Will eventually want to split out contention types into different
    # classes within the Contention module

    # usage: contend(a).will equal(b)
    class ContendEquality
      def initialize(a)
        @a = a
      end

      def equal(b)
        @b = b
        @b == @a
      end

      def fail_message
        "Contention: #{@b.inspect} \n
         Result: #{@a.inspect}"
      end
    end
  end
end
