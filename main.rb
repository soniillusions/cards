class Main
  require_relative 'card_data'
  require_relative 'card'
  include CardData

  attr_accessor :deck
  attr_accessor :sort_order

  def initialize
    @deck = []
    @sort_order = %w[♠️ ❤️ ♦️ ♣️]
  end

  def create_cards(amount)
    while deck.size < amount
      new_card = Card.new
      new_value = new_card.value

      unless deck.any? {|card| card.value == new_value }
        deck << new_card
      end
    end
  end

  # Temporary method for development
  def show_deck
    deck.each do |card|
      card.show_data
      puts ''
    end
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

  def sort
    sorted = []
    sort_order.each do |suit|
      suits = deck.select {|card| card.suit == suit }
      suits_by_value =suits.sort_by {|card| card.value }
      suits_sort = suits_by_value.map {|card| card.show}
      sorted += suits_sort
    end

    puts sorted.join(', ')
  end

  def change_sort
    puts 'Вы хотите сменить порядок сортировки?'
    print 'введите Y/N: '

    loop do
      answer = gets.chomp.capitalize

      if answer == 'N'
        break
      elsif answer == 'Y'
        change_sort!
        break
      else
        print 'Ошибка! Введите "Y" или "N": '
      end
    end
  end

  def change_sort!
    order = []
    old_answers = []

    puts 'Установите порядок: '
    puts '1 - ❤️'
    puts '2 - ♦️'
    puts '3 - ♣️'
    puts '4 - ♠️'

    (1..4).each do |i|
      loop do
        print "Укажите масть для #{i} позиции: "
        answer = gets.to_i

        if (answer < 1 || answer > 4) && !old_answers.include?(answer)
          puts 'Ошибка! Введите корректное значение'
        else
          old_answers << answer
          order << SUITS_HASH[answer]
          break
        end
      end
    end

    self.sort_order = order
  end
end

main = Main.new
main.create_cards(10)
main.show_deck_format
puts ''

main.change_sort

main.sort