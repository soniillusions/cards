module CardData
  SUITS = %w[❤️ ♦️ ♣️ ♠️].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  SUITS_VALUES = SUITS.each_with_index.to_h.freeze
  RANKS_VALUES = RANKS.each_with_index.to_h.freeze
end