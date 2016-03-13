require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class Game

  def initialize(name1 = "Player 1", name2 = "Player 2")
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(name1, :white, @display)
    @player2 = HumanPlayer.new(name2, :black, @display)

  end

  def play
    current_player = @player1

    until @board.checkmate?(current_player.color)
      @display.render
      moves = current_player.play_turn
      @board.move(moves[0], moves[1])
      current_player == @player1 ? current_player = @player2 : current_player = @player1
    end
  end

end
