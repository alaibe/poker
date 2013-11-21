require_relative '../../spec_helper'

describe Poker::Card do
  
  describe '# <=>' do
    subject { card_one > card_two }
    
    context 'When values are number' do
      let(:card_one) { Poker::Card.new('9', 'C') }
      let(:card_two) { Poker::Card.new('5', 'C') }
      
      it { should be_true }
    end
    
    context 'When values are symbol' do
      let(:card_one) { Poker::Card.new('A', 'C') }
      let(:card_two) { Poker::Card.new('K', 'C') }
      
      it { should be_true }
    end
  end
end