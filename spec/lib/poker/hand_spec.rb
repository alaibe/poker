require_relative '../../spec_helper'

describe Poker::Hand do
  
  describe "#kicker" do
    subject { hand.kicker.value }
    let(:hand) { Poker::Hand.new '2H 3H 8S AD JD' }
      
    it { should eq 'A' }
  end
  
  describe "#rank" do
    subject { hand.rank }
    context "When nothing is found" do
      let(:hand) { Poker::Hand.new '2H 3H 8S AD JD' }
      
      it { should eq 0 }
    end
    
    context "When a pair is found" do
      let(:hand) { Poker::Hand.new '2H 2H 8S AD JD' }
      
      it { should eq 1 }
    end
  end
end