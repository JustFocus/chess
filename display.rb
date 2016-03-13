require "colorize"
require_relative "cursorable"
require_relative "board"

class Display

  include Cursorable

  def initialize(board)
    @cursor = [0,0]
    @selected = false
    @board = board
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      row.map.with_index do |piece, j|
        color_options = colors_for(i, j)
        piece.to_s.colorize(color_options)
      end
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor
      bg = :yellow
    elsif (i + j).odd?
      bg = :blue
    else
      bg = :white
    end
    {background: bg, color: :black}
  end

  def render
    system("clear")
    puts "Enter Move: "
    puts "Arrow keys, WASD to move. Enter to confirm."
    build_grid.each {|row| puts row.join}
  end


end
