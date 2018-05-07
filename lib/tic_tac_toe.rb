 def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
  ]

def empty_board(board) 
  board.all? {|idx| idx == " "} 
end  

def won?(board)
  WIN_COMBINATIONS.each  do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3   == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
      end
  end
  return false

  if empty_board(board) 
    return false
  end  
  if draw?(board) 
    return false
  end  
 WIN_COMBINATIONS.each do |array|
    if board[array[0]] == board[array[1]] && board[array[1]] == board[array[2]] && position_taken?(board, array[0])
      return array 
     end  
  end
end
end  


def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end 
end   

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end 
  end  
end   

def draw?(board)
  if full?(board) == true && !won?(board)
    return true
  end 
end   

def over?(board)
  if won?(board) || draw?(board) && full?(board)
    true
  end  
end


def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

def winner
  won?(board)
end

def turn_count(board)
  count = 0
  board.each do |place|
    if place == "X" || place == "O"
      count += 1
    end 
  end 
  count
end  

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
  end  
end  

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  turn_count = 0
  until turn_count == 9
    turn(board)
    turn_count += 1
    if won?(board)
      puts "Congratulations! #{winner}"
    else draw?(board)
      puts "It was a draw!"
    end  
  end
end  