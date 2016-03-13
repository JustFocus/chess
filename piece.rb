

class Piece

  attr_accessor :pos
  attr_reader :color, :board

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves(pos)
    move_list = []
    self.find_moves(pos).each do |move|
      move_list << move #if legal_move?(move)
    end
    move_list
  end

  def to_s
    @char
  end

  def legal_move?(move)
    temp_board = @board.dup
    temp_board.move!(@pos, move)
    !move_into_check?(temp_board)
  end

  def move_into_check?(temp_board)
    temp_board.in_check?(self.color)
  end

  def dup
    piece_class = self.class
    piece_class.new(self.pos, self.board, self.color)
  end

end
