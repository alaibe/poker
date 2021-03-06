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
      let(:hand) { Poker::Hand.new '2H 2S 8S AD JD' }
      
      it { should eq 1 }
    end
    
    context "When a two pair is found" do
      let(:hand) { Poker::Hand.new '2H 2S AS AD JD' }
      
      it { should eq 2 }
    end
    
    context "When a three of a kind is found" do
      let(:hand) { Poker::Hand.new '2H 2S 2D AD JD' }
      
      it { should eq 3 }
    end
    
    context "When a straight is found" do
      let(:hand) { Poker::Hand.new '2H 3S 4D 5D 6D' }
      
      it { should eq 4 }
    end
    
    context "When a flush is found" do
      let(:hand) { Poker::Hand.new '2D 3D 9D 5D 8D' }
      
      it { should eq 5 }
    end
    
    context "When a full house is found" do
      let(:hand) { Poker::Hand.new '2H 2S 2D JD JD' }
      
      it { should eq 6 }
    end
    
    context "When a four of a kind is found" do
      let(:hand) { Poker::Hand.new '2H 2S 2D 2D JD' }
      
      it { should eq 7 }
    end
    
    context "When a straight flush is found" do
      let(:hand) { Poker::Hand.new '2D 3D 4D 5D 6D' }
      
      it { should eq 8 }
    end
  end
end