require_relative "../fast_test_helper"
require_relative "../support/test_board_repository"
require_relative "../../app/models/board"

class BoardTest < Minitest::Test
  def setup
    Board.repository = TestBoardRepository
  end

  def teardown
    Board.repository = nil
  end

  def test_creates_slug
    board = Board.new(name: "Test Board", board: [])
    assert_equal "test-board", board.slug
  end

  def test_slug_cannot_be_set
    board = Board.new(name: "Test Board", board: [])
    assert_raises(NoMethodError) { board.slug=("test") }
  end

  def test_slug_uniqueness
    board = Board.new(name: "Test Board", board: [])
    TestBoardRepository.stub :slug_taken?, -> (slug) { slug == "test-board" } do
      assert_equal board.slug, "test-board1"
    end
  end

  def test_slug_number_can_be_two
    board = Board.new(name: "Test Board", board: [])
    TestBoardRepository.stub :slug_taken?, -> (slug) { ["test-board", "test-board1"].include? slug } do
      assert_equal board.slug, "test-board2"
    end
  end
end
