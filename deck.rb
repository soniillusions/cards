class Deck
  require_relative 'card'
  require_relative 'card_data'
  require_relative 'bin_search'
  require_relative 'deck_printer'
  require_relative 'deck_sorter'
  
  include CardData
  include BinSearch
  include DeckPrinter
  include DeckSorter

  attr_accessor :deck
  attr_accessor :sort_order

  def initialize
    @deck = []
    @sort_order = %w[♠️ ❤️ ♦️ ♣️]
  end

  def create_cards(amount)
    if amount > 52
      puts "Error: You can't create more than 52 cards."
      exit
    end

    while deck.size < amount
      new_card = Card.new
      new_value = new_card.value

      unless deck.any? {|card| card.value == new_value }
        deck << new_card
      end
    end
  end
end

deck = Deck.new
deck.create_cards(10)
deck.show_deck_format

deck.change_sort
deck.sort

deck.bin_search