class Main
  require_relative 'card_data'
  require_relative 'card'
  include CardData

  attr_accessor :deck

  def initialize
    @deck = []
  end

  def create_cards(amount)
    while self.deck.size < amount
      new_card = Card.new
      new_value = new_card.value

      unless @deck.any? {|card| card.value == new_value }
        @deck << new_card
      end
    end
  end

  # Temporary method for development
  def show_deck
    self.deck.each do |card|
      card.show_data
      puts ''
    end
  end

  def show_deck_format
    hearts = self.deck.select {|card| card.suit == '❤️'}
    puts "❤️: #{hearts.size}"
    puts "Values: #{hearts.map {|card| card.rank }.join(', ')}"

    diamonds = self.deck.select {|card| card.suit == '♦️'}
    puts "♦️️: #{diamonds.size}"
    puts "Values: #{diamonds.map {|card| card.rank }.join(', ')}"

    clubs = self.deck.select {|card| card.suit == '♣️'}
    puts "♣️️: #{clubs.size}"
    puts "Values: #{clubs.map {|card| card.rank }.join(', ')}"

    spades = self.deck.select {|card| card.suit == '♠️'}
    puts "♠️️: #{spades.size}"
    puts "Values: #{spades.map {|card| card.rank }.join(', ')}"
  end

  def sort
    spades = self.deck.select {|card| card.suit == '♠️'}
    spades_by_value = spades.sort_by {|card| card.value}
    spades_sort = spades_by_value.map {|card| card.show}

    hearts = self.deck.select {|card| card.suit == '❤️'}
    hearts_by_value = hearts.sort_by {|card| card.value}
    hearts_sort = hearts_by_value.map {|card| card.show}

    diamonds = self.deck.select {|card| card.suit == '♦️'}
    diamonds_by_value = diamonds.sort_by {|card| card.value}
    diamonds_sort = diamonds_by_value.map {|card| card.show}

    clubs = self.deck.select {|card| card.suit == '♣️'}
    clubs_by_value = clubs.sort_by {|card| card.value}
    clubs_sort = clubs_by_value.map {|card| card.show}

    sorted_arr = spades_sort + hearts_sort + diamonds_sort + clubs_sort
    puts sorted_arr.join(', ')
  end
end

main = Main.new
main.create_cards(10)
main.show_deck_format
puts ''
main.sort