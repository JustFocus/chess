class NullPiece < Piece

  def initialize(pos, board, color)
    super(pos, board, color)
    @char = '    '
    @move_list = nil
  end
end
