module Poker
  class Hand
    include Comparable
    
    attr_reader :cards
    
    RANK = {
      5 => :flush?,
      4 => :straight?,
      3 => :three_of_kind?,
      2 => :two_pair?,
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
      cards_grouped_by_value.select { |value_group| value_group.count == 2 }.length == 1
    end
    
    def two_pair?
      cards_grouped_by_value.select { |value_group| value_group.count == 2 }.length == 2
    end
    
    def three_of_kind?
      cards_grouped_by_value.select { |value_group| value_group.count == 3 }.length == 1
    end
    
    def straight?
      ordered_cards.map(&:to_i).each_cons(2).all? { |x, y| y == x + 1 }
    end
    
    def flush?
      cards_grouped_by_suit.select { |value_group| value_group.count == 5 }.length == 1
    end
    
    def ordered_cards
      cards.sort_by(&:to_i)
    end
    
    def cards_grouped_by_value
      cards.group_by(&:value).values
    end
    
    def cards_grouped_by_suit
      cards.group_by(&:suit).values
    end

  end
end