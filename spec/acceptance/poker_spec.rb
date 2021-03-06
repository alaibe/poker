require_relative '../spec_helper'

describe 'Poker' do
  let(:as_kicker)       { '2H 3H 8S AD JD' }
  let(:nine_kicker)     { '2H 3H 8S 9D 4D' }
  let(:pair)            { '2H 2S 8S AD JD' }
  let(:two_pair)        { '2H 2H 8S 8D JD' }
  let(:three_of_a_kind) { '2H 2S 2D 8D JD' }
  let(:straight)        { '2H 3S 4D 5D 6D' }
  let(:flush)           { '2H 9H 4H 5H 6H' }
  let(:full_house)      { '2H 2S 2D JD JD' }
  let(:four_of_a_kind)  { '2H 2S 2D 2D JD' }
  let(:straight_flush)  { '2D 3D 4D 5D 6D' }
  
  describe 'an as kicker beats a nine kicker' do
    subject { Poker::Hand.new(as_kicker) > Poker::Hand.new(nine_kicker) }
    it { should be_true }
  end
  
  describe 'a pair beats an as kicker' do
    subject { Poker::Hand.new(pair) > Poker::Hand.new(as_kicker) }
    it { should be_true }
  end
  
  describe 'two pair beats a pair' do
    subject { Poker::Hand.new(two_pair) > Poker::Hand.new(as_kicker) }
    it { should be_true }
  end
  
  describe 'three of a kind beats two_pair' do
    subject { Poker::Hand.new(three_of_a_kind) > Poker::Hand.new(two_pair) }
    it { should be_true }
  end
  
  describe 'straight beats three of a kind' do
    subject { Poker::Hand.new(straight) > Poker::Hand.new(three_of_a_kind) }
    it { should be_true }
  end
  
  describe 'flush beats straight' do
    subject { Poker::Hand.new(flush) > Poker::Hand.new(straight) }
    it { should be_true }
  end
  
  describe 'full house beats flush' do
    subject { Poker::Hand.new(full_house) > Poker::Hand.new(flush) }
    it { should be_true }
  end
  
  describe 'four of a kind beats full_house' do
    subject { Poker::Hand.new(four_of_a_kind) > Poker::Hand.new(full_house) }
    it { should be_true }
  end
  
  describe 'straight flush beats four of a kind' do
    subject { Poker::Hand.new(straight_flush) > Poker::Hand.new(four_of_a_kind) }
    it { should be_true }
  end
end