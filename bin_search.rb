module BinSearch
  require_relative 'card_data'
  include CardData

  def bin_search
    puts 'Do you want to find a cart?'
    print 'Enter Y/N: '
    answer = gets.chomp.capitalize

    if answer == 'Y'
      deck.sort_by! {|card| card.value}

      search_suit = ''
      search_rank = ''


      puts 'Enter: 1 -> ❤️'
      puts 'Enter: 2 -> ♦️'
      puts 'Enter: 3 -> ♣️'
      puts 'Enter: 4 -> ♠️'
      print 'Set suit: '

      loop do
        suit = gets.to_i

        if suit < 1 || suit > 4
          print 'Error! Please enter a valid value!'
        else
          search_suit = SUITS_HASH[suit]
          break
        end
      end

      puts ''

      puts 'Enter: 2 -> 2'
      puts 'Enter: 3 -> 3'
      puts 'Enter: 4 -> 4'
      puts 'Enter: 5 -> 5'
      puts 'Enter: 6 -> 6'
      puts 'Enter: 7 -> 7'
      puts 'Enter: 8 -> 8'
      puts 'Enter: 9 -> 9'
      puts 'Enter: 10 -> 10'
      puts 'Enter: 11 -> Jack'
      puts 'Enter: 12 -> Queen'
      puts 'Enter: 13 -> King'
      puts 'Enter: 14 -> Ace'
      print 'Enter the value: '

      loop do
        rank = gets.to_i

        if rank < 2 || rank > 14
          print 'Error! Please enter a valid value!'
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
          puts "#{search_card} - This card is already in the deck!"
          found = true
          break
        end
      end

      puts "#{search_card} - This card is not in the deck!" unless found
    else
      false
    end
  end
end