require 'spec_helper'

RSpec.describe Caramello::Logger do
  describe '#log' do
    let(:message) { "This test will pass! - ✔" }

    context 'with no stream specified' do
      subject { described_class.new }

      it "will output the message to stdout" do
        expect { described_class.new.log(message) }
          .to output(/This test will pass! - ✔/)
          .to_stdout
      end
    end
  end
end
