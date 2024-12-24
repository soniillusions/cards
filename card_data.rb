module CardData
  SUITS = %w[❤️ ♦️ ♣️ ♠️].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  SUITS_VALUES = SUITS.each_with_index.to_h.freeze
  RANKS_VALUES = RANKS.each_with_index.to_h.freeze

  SUITS_HASH = {
    1 => '❤️',
    2 => '♦️',
    3 => '♣️',
    4 => '♠️'
  }.freeze

  RANKS_HASH = {
    1 => '2',
    2 => '3',
    3 => '4',
    4 => '5',
    5 => '6',
    6 => '7',
    7 => '8',
    8 => '9',
    9 => '10',
    10 => 'Jack',
    11 => 'Queen',
    12 => 'King',
    13 => 'Ace'
  }.freeze
end