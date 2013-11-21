require_relative '../spec_helper'

describe 'Poker' do
  let(:as_kicker)   { '2H 3H 8S AD JD' }
  let(:nine_kicker) { '2H 3H 8S 9D 4D' }
  
  describe 'an as kicker beat a nine kicker' do
    result = Poker::Hand.new(as_kicker) > Poker::Hand.new(nine_kicker)
    expect(result).to be_true
  end
end