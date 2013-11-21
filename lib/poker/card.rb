module Poker
  class Card < Struct.new(:value, :suit)
    include Comparable

    VALUES = %W(2 3 4 5 6 7 8 9 T J Q K A)

    def to_i
      @to_i ||= VALUES.index value
    end
    
    protected
    
    def <=>(card)
      to_i <=> card.to_i
    end
  end
end