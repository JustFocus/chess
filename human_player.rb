require_relative 'cursorable'

class HumanPlayer
  include Cursorable

  attr_reader :color

  def initialize(name, color, display)
    @display = display
    @name = name
    @color = color
  end

  def play_turn
    start_pos = nil
    end_pos = nil
    while start_pos.nil?
      start_pos = @display.get_input
      @display.render
    end
    while end_pos.nil?
      end_pos = @display.get_input
      @display.render
    end
    [start_pos, end_pos]
  end
end
