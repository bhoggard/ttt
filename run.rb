#!/usr/bin/env ruby

require './lib/board'

board = Board.new

player = %w(X O).sample
puts "\n#{board}\n"

until board.won? || board.draw?
  puts "player #{player} choose a number\n"

  ok_input = false
  until ok_input
    position = gets.chomp.to_i
    if 1 <= position && position <= 9 && !board.already_played(position)
      ok_input = true
    else
      puts 'try again!'
    end
  end

  board.set(position, player)
  player = (player == 'X') ? 'O' : 'X'

  puts "\n#{board}\n"
end

if board.won?
  puts "player #{board.won?} won the game!"
else
  puts 'it was a draw'
end
