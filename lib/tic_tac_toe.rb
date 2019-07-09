class TicTacToe


# initialize the game with an 3x3 array
    def initialize
        @board = Array.new(9 , " ")
    end

# arbitrary arrangement of the board
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "---------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "---------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

# user input to index.  must reduce index by 1 to match array
    def input_to_index(input)
        @input = input.to_i - 1
    end

# place tictac in index
    def move(index, tictac)
        @board[index] = tictac
    end

# true or false for position in index
    def position_taken?(position)
        @board[position] != " "
    end

# valid if input is truthy for 0..8 & if input not previously taken
    def valid_move?(input)
        (0..8).include?(input) && !position_taken?(input)
    end

# board count of every board position that is not empty
    def turn_count
        @board.count{|position| position != " "}
    end


# player movement ex: O > X > O > X > O.  Odd: O Even: X   
    def current_player
        turn_count.even? ? "X" : "O"
    end

# request player action.  sets location to user input.  if location is empty, 
# the location of tictac is set.  the board is displayed. if the location is
# not empty, the request is made again.
    def turn 
        puts "Make a move compadre"
        input = gets.strip
        location = input_to_index(input)
        if valid_move?(location)
            tictac = current_player
            move(location, tictac)
            display_board
        else
            turn
        end
    end

#remember first object in an array has an id of 0
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

# This will search for three matching board combinations. The combinations are taken from the WIN_COMBINATIONS variable at the top of this file.  
    def won?
        WIN_COMBINATIONS.any? { |currentBoard| 
            if position_taken?( currentBoard[0] ) && @board[currentBoard[0]] == @board[currentBoard[1]] && @board[currentBoard[1]] == @board[currentBoard[2]]
                return currentBoard
        end
    }
    end

# The board is recognized as full if all board locations are NOT empty
    def full?
        @board.all? { |location| location != " "}
    end

# The game recognizes the game as a draw when the count of player actions is equal and/or both are NOT won.
    def draw?
        !won? && full?
    end

# the game is if either the game is won or the game resulted in a draw
    def over?
        draw? || won?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end


