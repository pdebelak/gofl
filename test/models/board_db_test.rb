require "test_helper"

class BoardDBTest < Minitest::Test

  def teardown
    BoardRepository.destroy_all
  end

  def test_loads_by_name
    board = [[0,0],[0,0]]
    Board.new(name: "Test Board", board: board).publish
    assert_equal board, Board.load(name: "Test Board").board
  end

  def test_loads_by_slug
    board = [[1,1],[1,1]]
    Board.new(name: "Test Board", board: board).publish
    assert_equal board, Board.load(slug: "test-board").board
  end
end
