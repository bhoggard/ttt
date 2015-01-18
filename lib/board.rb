# represent the game board
# layout is:
#   1 2 3
#   4 5 6
#   7 8 9
#
class Board
  def initialize
    @square = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  # set a board square to x or o
  def set(position, xo)
    fail ArgumentError unless
      (1 <= position && position <= 9) && (xo == :x || xo == :o)
    i = (position - 1) / 3
    j = (position - 1) % 3
    @square[i][j] = xo.to_s.upcase
  end

  def to_s
    str = ''
    (0..2).each do |i|
      (0..2).each do |j|
        str << ' '
        if @square[i][j].nil?
          str << (i * 3 + j + 1).to_s
        else
          str << @square[i][j]
        end
      end
      str << "\n"
    end
    str
  end
end
