
class Knight < SteppingPieces

  def initialize(pos, board, color)
    super(pos, board, color)
    color == :white ? @char = ' ♘  ' : @char = ' ♞  '
    @move_list = [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [-1, 2],
      [1, -2],
      [-1, -2]
    ]

  end


end
