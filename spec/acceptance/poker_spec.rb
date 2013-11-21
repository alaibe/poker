require_relative '../spec_helper'

describe 'Poker' do
  let(:as_kicker)   { '2H 3H 8S AD JD' }
  let(:nine_kicker) { '2H 3H 8S 9D 4D' }
  let(:pair)        { '2H 2H 8S AD JD' }
  
  describe 'an as kicker beats a nine kicker' do
    subject { Poker::Hand.new(as_kicker) > Poker::Hand.new(nine_kicker) }
    it { should be_true }
  end
  
  describe 'a pair beats an as kicker' do
    subject { Poker::Hand.new(pair) > Poker::Hand.new(as_kicker) }
    it { should be_true }
  end
end