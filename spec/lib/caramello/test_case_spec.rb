require 'spec_helper'

RSpec.describe Caramello::TestCase do
  subject { described_class }

  describe '#run' do
    context 'with a passing test' do
      let(:test_case) do
        subject.new('foo equals foo') do
          contend('foo').to equal('foo')
        end
      end

      it 'returns a hash with a pass value of true' do
        expect(test_case.run).to eql(pass: true)
      end
    end

    context 'with a failing test' do
      let(:test_case) do
        subject.new('this is how subtraction works') do
          contend(1 - 3).to equal(2)
        end
      end

      it 'returns a hash with a pass value of false, with the failing message' do
        expect(test_case.run).to eql(pass: false, fail_message: "Predicted: 2\nResult: -2")
      end
    end
  end
end
