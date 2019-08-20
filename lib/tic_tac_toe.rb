class TicTacToe

def initialize (board = nil)
 @board = board || Array.new(9, " ")
end 

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
 [6,7,8],
 [0,4,8],
 [2,4,6],
  [1,4,7],
   [0,3,6],
    [2,5,8]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  num=input.to_i
num-1
end

def move

end





end