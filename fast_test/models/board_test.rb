require_relative "../fast_test_helper"
require_relative "../../app/models/board"

class BoardTest < GoflFastTest
  def board
    Board.new(name: "Test Board", board: [])
  end

  def test_creates_slug
    assert_equal "test-board", board.slug
  end

  def test_slug_cannot_be_set
    assert_raises(NoMethodError) { board.slug=("test") }
  end

  def test_slug_uniqueness
    TestBoardRepository.stub :slug_taken?, -> (slug) { slug == "test-board" } do
      assert_equal board.slug, "test-board1"
    end
  end

  def test_slug_number_can_be_two
    TestBoardRepository.stub :slug_taken?, -> (slug) { ["test-board", "test-board1"].include? slug } do
      assert_equal board.slug, "test-board2"
    end
  end

  def test_slug_with_nil_name
    board = Board.new
    assert_equal board.slug, nil
  end

  def test_height
    board = Board.new(name: "Test Board", board: [[false],[false]])
    assert_equal board.height, 2
  end

  def test_width
    board = Board.new(name: "Test Board", board: [[false],[false]])
    assert_equal board.width, 1
  end

  def test_generate_generates_correct_dimensions
    board = Board.generate(height: 20, width: 30)
    assert_equal board.height, 20
    assert_equal board.width, 30
  end

  def test_generate_sets_all_dead
    board = Board.generate(height: 20, width: 30)
    assert_equal board.board[0][0], false
    assert_equal board.board[-1][-1], false
  end
end
