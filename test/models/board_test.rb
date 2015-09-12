require "test_helper"

class BoardDBTest < ActiveSupport::TestCase

  def board
    [[true,true],[true,true]]
  end

  def teardown
    BoardRepository.destroy_all
  end

  def create_board(args={})
    attributes = { name: "Test Board", board: board }.merge(args)
    Board.new(attributes).share
  end

  def test_loads_by_slug
    create_board
    assert_equal board, Board.load(slug: "test-board").board
  end

  def test_can_set_example
    create_board(example: true)
    assert Board.load(slug: "test-board").example?
  end

  def test_can_load_examples
    create_board(example: true)
    create_board(example: false)
    assert_equal Board.examples.count, 1
    assert Board.examples.first.example?
  end
end
