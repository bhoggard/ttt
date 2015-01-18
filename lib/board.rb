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
      (1 <= position && position <= 9) && xo?(xo)
    if already_played(position)
      false
    else
      @square[position - 1] = xo
    end
  end

  def already_played(position)
    fail ArgumentError unless 1 <= position && position <= 9
    xo?(@square[position - 1])
  end

  def xo?(val)
    val == 'X' || val == 'O'
  end

  def to_s
    rows = @square.each_slice(3).map { |i| i.join(' ') }
    rows.join("\n") + "\n"
  end

  # if someone has won, return 'X' or 'O'
  # else return false
  def won?
    rows.concat(columns).concat(diagonals).each do |line|
      return line[0] if line.all? { |i| i == line[0] }
    end
    false
  end

  def draw?
    @square.all? { |i| xo?(i) }
  end

  def rows
    @square.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [
      [@square[0], @square[4], @square[8]],
      [@square[2], @square[4], @square[6]]
    ]
  end
end
