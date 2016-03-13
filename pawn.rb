class Pawn < SlidingPieces

  def initialize(pos, board, color)
    super(pos, board, color)
    color == :white ? @char = ' ♙  ' : @char = ' ♟  '
    @has_moved = false
  end

  def find_moves(pos)
    moves = get_move_dirs(pos)
    final_moves = []
    moves.each do |move|
      if valid_move?(move)
        final_moves << move
      end
    end
    final_moves
  end

  def valid_move?(move)
    return false if move[0] > 7 || move[0] < 0 || move[1] > 7 || move[1] < 0
    true
  end

  def get_move_dirs(pos)
    if self.color == :black
      dir_move = [[1,0], [2,0], [1,1], [1,-1]]
    else
      dir_move = [[-1, 0], [-2,0], [-1,-1], [-1, 1]]
    end
    dir_move[2..3].each do |attack_pos|
      if !@board.grid[attack_pos[0] + pos[0]][attack_pos[1] + pos[1]].nil?
        dir_move.delete(attack_pos) unless can_attack?(attack_pos, pos)
      end
    end
    #if !@board.grid[attack_pos[0] + pos[0]][attack_pos[1] + pos[1]].nil?
      dir_move = forward_move_check(dir_move, pos)
    #end
    move_list = []
    dir_move.each do |move|
      move_list << [move[0] + pos[0], move[1] + pos[1]]
    end
    move_list
  end

  def can_attack?(attack_pos, pos)
    self.color != @board.grid[attack_pos[0] + pos[0]][attack_pos[1] + pos[1]].color
  end

  def forward_move_check(dir_move, pos)
    if !@board.grid[pos[0] + dir_move[0][0]][pos[1] + dir_move[0][1]].color.nil?
      dir_move = dir_move[2..-1]
    elsif @has_moved
      dir_move.delete_at(1)
    elsif !@board.grid[pos[0] + dir_move[1][0]][pos[1] + dir_move[1][1]].color.nil?
      dir_move.delete_at(1)
    end
    dir_move
  end
end
