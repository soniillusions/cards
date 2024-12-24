module BinSearch
  require_relative 'card_data'
  include CardData

  def bin_search
    deck.sort_by! {|card| card.value}

    search_suit = ''
    search_rank = ''


    puts '1 - ❤️'
    puts '2 - ♦️'
    puts '3 - ♣️'
    puts '4 - ♠️'
    print 'Укажите масть: '

    loop do
      suit = gets.to_i

      if suit < 1 || suit > 4
        print 'Ошибка! Введите корректное значение: '
      else
        search_suit = SUITS_HASH[suit]
        break
      end
    end

    puts '1 - 2'
    puts '2 - 3'
    puts '3 - 4'
    puts '4 - 5'
    puts '5 - 6'
    puts '6 - 7'
    puts '7 - 8'
    puts '8 - 9'
    puts '9 - 10'
    puts '10 - Jack'
    puts '11 - Queen'
    puts '12 - King'
    puts '13 - Ace'
    print 'Укажите значение: '

    loop do
      rank = gets.to_i

      if rank < 1 || rank > 13
        print 'Ошибка! Введите корректное значение: '
      else
        search_rank = RANKS_HASH[rank]
        break
      end
    end

    search_card = "#{search_rank}#{search_suit}"
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
        puts "#{search_card} - Такая карта есть в коллоде!"
        found = true
        break
      end
    end

    puts "#{search_card} - Такой карты нет в коллоде!" unless found
  end
end