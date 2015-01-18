# represent the game board
# layout is:
#   1 2 3
#   4 5 6
#   7 8 9
#
class Board
  def initialize
    @square = (1..9).to_a
  end

  # set a board square to x or o
  def set(position, xo)
    fail ArgumentError unless
      (1 <= position && position <= 9) && (xo == :x || xo == :o)
    @square[position - 1] = xo.to_s.upcase
  end

  def to_s
    rows = @square.each_slice(3).map { |i| i.join(' ') }
    rows.join("\n") + "\n"
  end

  def won?
    false
  end

  private

  def rows
  end
end
