require 'test_helper'

# test the Board class
class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_initial_state
    assert_equal "1 2 3\n4 5 6\n7 8 9\n", @board.to_s
  end

  def test_set_square_to_x
    @board.set(2, :x)
    assert_equal "1 X 3\n4 5 6\n7 8 9\n", @board.to_s
  end

  def test_set_square_to_o
    @board.set(7, :o)
    assert_equal "1 2 3\n4 5 6\nO 8 9\n", @board.to_s
  end

  def test_set_2_squares
    @board.set(3, :x)
    @board.set(6, :o)
    assert_equal "1 2 X\n4 5 O\n7 8 9\n", @board.to_s
  end

  def test_won
    refute @board.won?, 'board status is not won'
    @board.set(1, :x)
    @board.set(5, :x)
    @board.set(9, :x)
    assert_equal :x, @board.won?
  end
end
