class SlidingPieces < Piece

  def initialize(pos, board, color)
    super(pos, board, color)
    @current_moves = find_moves(@pos)
    @cardinal_dirs = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ]
    @diagonal_dirs = [
      [1, 1],
      [-1, 1],
      [1, -1],
      [-1, -1]
    ]
  end

  def find_moves(pos)
    moves = []
    p "#{pos} current position"
    dir_move = get_move_dirs
    dir_move.each do |dir|
      cur_move = [pos[0] + dir[0], pos[1] + dir[1]]
      while valid_move?(cur_move)
        p "#{cur_move} current move check"
        moves << cur_move
        #break if @color != @board.grid[cur_move[0]][cur_move[1]].color || !@board.grid[cur_move[0]][cur_move[1]].color.nil?
        cur_move = [cur_move[0] + dir[0], cur_move[1] + dir[1]]
      end
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

  def get_move_dirs
    move_dirs = []
    move_dirs += @cardinal_dirs if @cardinal
    move_dirs += @diagonal_dirs if @diagonal
    move_dirs
  end

end
