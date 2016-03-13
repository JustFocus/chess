require_relative "pieces"

class Board

  attr_accessor :grid


  def initialize(pop_switch = true)
    @grid = Array.new(8){|y| Array.new(8){ |x| NullPiece.new([y, x], self, nil)}}
    populate if pop_switch
  end

  def populate
    setup_array = [[Rook.new([0, 0], self, :black),
      Knight.new([0, 1], self, :black),
      Bishop.new([0, 2], self, :black),
      Queen.new([0, 3], self, :black),
      King.new([0, 4], self, :black),
      Bishop.new([0, 5], self, :black),
      Knight.new([0, 6], self, :black),
      Rook.new([0, 7], self, :black) ],
      [Rook.new([7, 0], self, :white),
      Knight.new([7, 1], self, :white),
      Bishop.new([7, 2], self, :white),
      Queen.new([7, 3], self, :white),
      King.new([7, 4], self, :white),
      Bishop.new([7, 5], self, :white),
      Knight.new([7, 6], self, :white),
      Rook.new([7, 7], self, :white)]
      ]
    @grid.each_with_index do |row, idx1|
      if idx1 == 0 || idx1 == 7
         idx1 == 0 ? piece_idx = 0 : piece_idx = 1

        row.each_with_index do |spot, idx2|
            @grid[idx1][idx2] = setup_array[piece_idx][idx2]
        end
      end
      if idx1 == 1 || idx1 == 6
        row.each_with_index do |spot, idx2|
          idx1 == 1 ? color = :black : color = :white
          @grid[idx1][idx2] = Pawn.new([idx1, idx2], self, color)
        end
      end
    end
  end

  def move(start, end_pos)
    move_list = @grid[start[0]][start[1]].moves(start)
    p move_list
    if move_list.include?(end_pos)
      @grid[end_pos[0]][end_pos[1]] = @grid[start[0]][start[1]]
      @grid[start[0]][start[1]] = NullPiece.new([start[0], start[1]], self, nil)
      @grid[end_pos[0]][end_pos[1]].pos = end_pos
    else
      raise ("Invalid Move.")
    end


  end

  def move!(start, end_pos)
    @grid[end_pos[0]][end_pos[1]] = @grid[start[0]][start[1]]
    @grid[start[0]][start[1]] = NullPiece.new([start[0], start[1]], self, nil)
  end

  def in_check?(color)
    king_loc = find_king(color)
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |piece, idx2|
        next if piece.color.nil?
        if piece.color != color
          piece.moves([idx1, idx2]).include?(king_loc)
        end
      end
    end
    false
  end

  def checkmate?(color)
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |piece, idx2|
        if piece.color == color
          return false  unless piece.moves([idx1, idx2]).empty?
        end
      end
    end
    true
  end

  def contains_piece?(piece)
    piece.is_a?(Piece)
  end

  def find_king(color)
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |piece, idx2|
        puts piece
        return [idx1, idx2] if piece.is_a?(King) && color == piece.color
      end
    end
  end

  def dup
    result = Board.new(false)
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |piece, idx2|
        result.grid[idx1][idx2] = piece.dup
      end
    end
    result
  end

end
