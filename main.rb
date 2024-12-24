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
      suits_by_value = suits.sort_by {|card| card.value }
      sorted += suits_by_value
    end

    self.deck = sorted
    show_deck
    puts ''
  end

  def show_deck
    puts deck.map {|card| card.show}.join(', ')
  end

  def show_deck_details
    deck.each do |card|
      card.show_data
      puts ''
    end
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

  def bin_search
    deck.sort_by! {|card| card.value}

    search_suit = ''
    search_rank = ''

    puts 'Укажите масть: '
    puts '1 - ❤️'
    puts '2 - ♦️'
    puts '3 - ♣️'
    puts '4 - ♠️'
    suit = gets.to_i

    loop do
      if suit < 1 || suit > 4
        puts 'Ошибка! Введите корректное значение'
      else
        search_suit = SUITS_HASH[suit]
        break
      end
    end

    puts 'Укажите значение: '
    puts '1 => 2'
    puts '2 => 3'
    puts '3 => 4'
    puts '4 => 5'
    puts '5 => 6'
    puts '6 => 7'
    puts '7 => 8'
    puts '8 => 9'
    puts '9 => 10'
    puts '10 => Jack'
    puts '11 => Queen'
    puts '12 => King'
    puts '13 => Ace'

    rank = gets.to_i

    loop do
      if rank < 1 || rank > 13
        puts 'Ошибка! Введите корректное значение'
      else
        search_rank = RANKS_HASH[rank]
        break
      end
    end

    search_value = SUITS_VALUES[search_suit] * RANKS.size + RANKS_VALUES[search_rank]

    low = 0
    high = deck.size - 1

    found = false

    while low <= high
      mid = (low + high) / 2

      if deck[mid].value > search_value
        high = mid - 1
      elsif deck[mid].value < search_value
        low = mid + 1
      else
        puts "Такая карта есть в коллоде!"
        found = true
        break
      end
    end

    puts 'Такой карты нет в коллоде!' unless found
  end
end

main = Main.new
main.create_cards(10)
main.show_deck_format
puts ''

# main.change_sort
main.sort

puts 'Вы хотите найти карту? '
print 'введите Y/N: '
answer = gets.chomp.capitalize

answer == 'Y' ? main.bin_search : false