
class Bishop < SlidingPieces

  def initialize(pos, board, color)
    super(pos, board, color)
    color == :white ? @char = ' ♗  ' : @char = ' ♝  '
    @cardinal = false
    @diagonal = true
  end

end
