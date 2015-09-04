require_relative "../fast_test_helper"
require_relative "../../app/decorators/example_board_decorator"
require_relative "../../app/models/board"

class ExampleBoardDecoratorTest < GoflFastTest
  def setup
    super
    @board1 = Board.new(name: "Board 1", example: true)
    @board2 = Board.new(name: "Board 2", example: true)
  end

  def test_examples_options
    Board.stub(:examples, [@board1, @board2]) do
      assert_equal ExampleBoardDecorator.example_options, [[@board1.name, @board1.slug], [@board2.name, @board2.slug]]
    end
  end

  def test_alphabetical_sorting_examples_options
    Board.stub(:examples, [@board2, @board1]) do
      assert_equal ExampleBoardDecorator.example_options, [[@board1.name, @board1.slug], [@board2.name, @board2.slug]]
    end
  end
end
