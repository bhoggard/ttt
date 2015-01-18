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
    assert @board.set(2, 'X')
    assert_equal "1 X 3\n4 5 6\n7 8 9\n", @board.to_s
  end

  def test_set_square_to_o
    assert @board.set(7, 'O')
    assert_equal "1 2 3\n4 5 6\nO 8 9\n", @board.to_s
  end

  def test_set_square_twice
    @board.set(1, 'X')
    refute @board.set(1, 'O')
    assert_equal "X 2 3\n4 5 6\n7 8 9\n", @board.to_s
  end

  def test_set_2_squares
    @board.set(3, 'X')
    @board.set(6, 'O')
    assert_equal "1 2 X\n4 5 O\n7 8 9\n", @board.to_s
  end

  def test_rows
    assert_equal [[1, 2, 3], [4, 5, 6], [7, 8, 9]], @board.rows
  end

  def test_columns
    assert_equal [[1, 4, 7], [2, 5, 8], [3, 6, 9]], @board.columns
  end

  def test_diagonals
    assert_equal [[1, 5, 9], [3, 5, 7]], @board.diagonals
  end

  def test_initial_not_won
    refute @board.won?, 'board status is not won'
  end

  def test_won_diagonal
    @board.set(1, 'X')
    @board.set(5, 'X')
    @board.set(9, 'X')
    assert_equal 'X', @board.won?
  end

  def test_won_column
    @board.set(3, 'X')
    @board.set(6, 'X')
    @board.set(9, 'X')
    assert_equal 'X', @board.won?
  end

  def test_initial_not_draw
    refute @board.draw?, 'board status is not draw'
  end

  def test_initial_not_draw
    (1..5).each { |i| @board.set(i, 'X') }
    (6..9).each { |i| @board.set(i, 'O') }
    assert @board.draw?, 'board status is draw'
  end
end
