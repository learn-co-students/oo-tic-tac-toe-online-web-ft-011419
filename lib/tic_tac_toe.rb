require "pry"
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

def move(index, token = "x")
@board[index] = token
end

def position_taken?(index)
@board[index] != " "
 
end
def valid_move?(index)
!position_taken?(index) && index.between?(0,8)
end
def turn_count
  @board.count {|move| move !=" "}
end
def current_player
  turn_count.even? ? "X" : "O"
end

def turn

    puts "Please enter a number (1-9):"	
    user_input = gets.strip
    index =input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
       puts "Please enter a number (1-9):"
       user_input = gets.strip
    end	
  end
def won?
 
  WIN_COMBINATIONS.any? { |key|
  if   position_taken?( key[0] ) && @board[key[0]] ==  @board[key[1]] && @board[key[1]]==@board[key[2]] 
    
    return key # can be buggy if you use return to break a loop  but i am lazy today 
  end
}
end   

  def full?	
      @board.all?{|square| square != " " }	
  end	

   def draw?	
    full? && !won?	
  end	

   def over?	
    won? || draw?	
  end
      def winner
        won? ? @board[won?[0]] : nil
    end



   def play
        turn until over?
        if won?  
      
          puts "Congratulations #{winner}!" 
        else
          puts  "Cat's Game!"
        end
    end
end