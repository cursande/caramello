test_behaviour "strengs" do
  subject.setup 'conbabbination' do
    test_case('streng add yes') do
      contend('streng' + 'is' + 'gud').to equal('conbabbination')
    end
  end
end
