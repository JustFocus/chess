
class Rook < SlidingPieces

  def initialize(pos, board, color)
    super(pos, board, color)
    color == :white ? @char = ' ♖  ' : @char = ' ♜  '
    @cardinal = true
    @diagonal = false
  end
end
