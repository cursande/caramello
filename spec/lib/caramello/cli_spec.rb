require 'spec_helper'

RSpec.describe Caramello::CLI do
  subject { described_class }

  context 'with no arguments passed' do
    it 'just runs the test cases with default options' do
      expect_any_instance_of(subject)
        .to receive(:run)
        .with([
          './spec/lib/caramello/fixtures/passing_test.rb',
          './spec/lib/caramello/fixtures/failing_test.rb'
        ], {})

      subject.new
    end
  end

  context 'with a path provided' do
    context 'with a path to a file provided' do
    let(:args) { ['./spec/lib/caramello/fixtures/passing_test.rb'] }

      it 'runs test cases within the file specified' do
        expect_any_instance_of(subject)
          .to receive(:run)
          .with(['./spec/lib/caramello/fixtures/passing_test.rb'], {})

        subject.new(args)
      end
    end

    context 'with a path to a directory provided' do
    let(:args) { ['./spec/lib/caramello/fixtures'] }

      it 'runs test cases within the directory specified' do
        expect_any_instance_of(subject)
          .to receive(:run)
          .with([
            './spec/lib/caramello/fixtures/passing_test.rb',
            './spec/lib/caramello/fixtures/failing_test.rb'
          ], {})

        subject.new(args)
      end
    end


  end

  context 'with a style option passed in as an argument' do
    let(:args) { ['test_dir/','-s', 'rodney'] }

    xit 'applies the style option when formatting stdout' do
    end
  end

  context 'with the version passed in as an argument' do
    let(:args) { ['-v'] }

    it 'prints the current version of Caramello to stdout' do
      expect(subject.new(args))
        .to output(Regexp.quote(Caramello::VERSION))
        .to_stdout
    end
  end
end
