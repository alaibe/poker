module Poker
  class Hand
    include Comparable
    
    def initialize(cards)
      @cards = cards.scan(/\S{2}/).map { |str| Card.new(str[0], str[1]) }
    end
    
    def rank
      0
    end
    
    def kicker
      ordered_cards.last
    end
    
    def <=>(hand)
      kicker <=> hand.kicker
    end
    
    private
    
    def ordered_cards
      @cards.sort_by(&:to_i)
    end
  end
end