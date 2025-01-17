class TicTacToe
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
@board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  num_of_turns = turn_count
  if num_of_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
player
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
      combo
    end
  end
end

def full?
  if (!@board.any?{|position| position == " "})
    true
  else
    false
  end
end

def draw?
  if full? && !(won?)
    true
  else
    false
  end
end

def over?
  if full? || won?|| draw?
    true
  end
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  until over? == true
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
