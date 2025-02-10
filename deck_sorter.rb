module DeckSorter
  require_relative 'card_data'
  include CardData

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

  def change_sort
    puts ''
    puts 'Do you want to change the sorting order?'
    print 'Enter Y/N: '

    loop do
      answer = gets.chomp.capitalize

      if answer == 'N'
        break
      elsif answer == 'Y'
        puts ''
        change_sort!
        break
      else
        print 'Error! Enter "Y" or "N": '
      end
    end
    puts ''
  end

  def change_sort!
    order = []
    old_answers = []

    puts 'Set the order: '
    puts '1 - ❤️'
    puts '2 - ♦️'
    puts '3 - ♣️'
    puts '4 - ♠️'

    (1..4).each do |i|
      loop do
        print "Choose the suit for position #{i}: "
        answer = gets.to_i

        if (answer < 1 || answer > 4) && !old_answers.include?(answer)
          puts 'Error! Please enter a valid value!'
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