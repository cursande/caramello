require 'spec_helper'

RSpec.describe Caramello::Context do
  subject { described_class }

  describe '.setup' do
    context 'with a one-level nested context' do
      let(:context) do
        subject.setup 'squaring' do
          test_case('4 squared returns 16') do
            contend(4**2).to equal(16)
          end
        end
      end

      it 'returns the test description and that it passed' do
        expect { context.run }
          .to output('4 squared returns 16 => pass')
          .to_stdout
      end
    end
  end
end
