module DeckPrinter
  def show_deck
    puts deck.map {|card| card.show}.join(', ')
  end

  def show_deck_format
    hearts = deck.select {|card| card.suit == '❤️'}
    puts "❤️: #{hearts.size}"
    puts "Values: #{hearts.map {|card| card.rank }.join(', ')}"

    diamonds = deck.select {|card| card.suit == '♦️'}
    puts "♦️️: #{diamonds.size}"
    puts "Values: #{diamonds.map {|card| card.rank }.join(', ')}"

    clubs = deck.select {|card| card.suit == '♣️'}
    puts "♣️️: #{clubs.size}"
    puts "Values: #{clubs.map {|card| card.rank }.join(', ')}"

    spades = deck.select {|card| card.suit == '♠️'}
    puts "♠️️: #{spades.size}"
    puts "Values: #{spades.map {|card| card.rank }.join(', ')}"
  end

  def show_deck_details
    deck.each do |card|
      card.show_data
      puts ''
    end
  end
end