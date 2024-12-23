class Card
  require_relative 'card_data'
  include CardData

  attr_accessor :suit, :rank, :value

  def initialize
    @suit = random_suit
    @rank = random_rank
    @value = SUITS_VALUES[@suit] * RANKS.size + RANKS_VALUES[@rank]
  end

  def random_suit
    SUITS[rand(0..3)]
  end

  def random_rank
    RANKS[rand(0..12)]
  end

  def show
    "#{self.rank}#{self.suit}"
  end

  def show_data
    puts "suit: #{@suit}"
    puts "rank: #{@rank}"
    puts "value: #{@value}"
  end
end