module BinSearch
  require_relative 'card_data'
  include CardData

  def bin_search
    deck.sort_by! {|card| card.value}

    search_suit = ''
    search_rank = ''


    puts 'введите: 1 -> ❤️'
    puts 'введите: 2 -> ♦️'
    puts 'введите: 3 -> ♣️'
    puts 'введите: 4 -> ♠️'
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

    puts ''

    puts 'введите: 2 -> 2'
    puts 'введите: 3 -> 3'
    puts 'введите: 4 -> 4'
    puts 'введите: 5 -> 5'
    puts 'введите: 6 -> 6'
    puts 'введите: 7 -> 7'
    puts 'введите: 8 -> 8'
    puts 'введите: 9 -> 9'
    puts 'введите: 10 -> 10'
    puts 'введите: 11 -> Jack'
    puts 'введите: 12 -> Queen'
    puts 'введите: 13 -> King'
    puts 'введите: 14 -> Ace'
    print 'Укажите значение: '

    loop do
      rank = gets.to_i

      if rank < 2 || rank > 14
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