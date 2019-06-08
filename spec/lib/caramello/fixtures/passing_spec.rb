Caramello.test_behaviour "numbas" do
  explain 'squaring' do
    test_case('4 squared returns 16') do
      contend(4**2).to equal(16)
    end
  end
end
