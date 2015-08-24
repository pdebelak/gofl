class ExampleBoardDecorator
  class << self
    def example_options
      Board.examples.sort_by(&:name).map { |board| [board.name, board.slug] }
    end
  end
end
