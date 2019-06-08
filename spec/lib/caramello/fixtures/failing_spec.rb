test_behaviour "strengs" do
  Context.setup 'conbabbination' do
    test_case('streng add yes') do
      contend('streng' + 'is' + 'gud').to equal('conbabbination')
    end
  end
end
