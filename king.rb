
class King < SteppingPieces

  def initialize(pos, board, color)
    super(pos, board, color)
    color == :white ? @char = ' ♔  ' : @char = ' ♚  '
    @move_list = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ]
  end

end
