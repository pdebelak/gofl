require "test_helper"

class BoardDBTest < ActiveSupport::TestCase

  def teardown
    BoardRepository.destroy_all
  end

  def test_loads_by_name
    board = [[false,false],[false,false]]
    Board.new(name: "Test Board", board: board).publish
    assert_equal board, Board.load(name: "Test Board").board
  end

  def test_loads_by_slug
    board = [[true,true],[true,true]]
    Board.new(name: "Test Board", board: board).publish
    assert_equal board, Board.load(slug: "test-board").board
  end
end
