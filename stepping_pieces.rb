class SteppingPieces < Piece
  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def find_moves(pos)
    moves = []
    @move_list.each do |move|
      cur_move = [pos[0] + move[0], pos[1] + move[1]]
      moves << cur_move if valid_move?([pos[0] + move[0], pos[1] + move[1]])
    end
    moves
  end

  def valid_move?(move)
    if move[0] > 7 || move[0] < 0 || move[1] > 7 || move[1] < 0
      return false
    end
    return false if @color == @board.grid[move[0]][move[1]].color
    true
  end

end
