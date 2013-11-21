module Poker
  class Hand
    include Comparable
    
    RANK = {
      1 => :pair?,
      0 => :highest?
    }
    
    def initialize(cards)
      @cards = cards.scan(/\S{2}/).map { |str| Card.new(str[0], str[1]) }
    end
    
    def rank
      @rank ||= RANK.find { |value, method| self.send(method) }.first
    end
    
    def kicker
      ordered_cards.last
    end
    
    def <=>(hand)
      return kicker <=> hand.kicker if rank == hand.rank
      
      rank <=> hand.rank
    end
    
    private
    
    def highest?
      true
    end
    
    def pair?
      @cards.map(&:to_i).uniq.length == 4
    end
    
    def ordered_cards
      @cards.sort_by(&:to_i)
    end
  end
end