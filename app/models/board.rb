class Board
  class << self
    attr_writer :repository

    def load(attributes)
      repository.load_from_attributes(attributes)
    end

    def examples
      repository.examples
    end

    def generate(height:, width:)
      Board.new(board: Array.new(height) { Array.new(width, false)} )
    end

    def repository
      @repository ||= BoardRepository
    end
  end

  attr_reader :name, :board

  def initialize(name: nil, board: nil, slug: nil, example: false)
    @name = name
    @board = board
    @slug = slug
    @example = example
  end

  def share
    as_repository.save
  end

  def slug
    @slug ||= calculate_slug
  end

  def height
    board.length
  end

  def width
    board[0].length
  end

  def example?
    @example
  end

  private

  def repository
    self.class.repository
  end

  def as_repository
    repository.new(name: name, board: board, slug: slug, example: @example)
  end

  def calculate_slug(num: nil)
    return unless name
    # see http://stackoverflow.com/questions/4308377/ruby-post-title-to-slug
    # for where this code came from
    @slug = name.downcase.strip.gsub(" ", "-".gsub(/[^\w-]/, "")) + "#{num}"
    if repository.slug_taken?(slug)
      calculate_slug(num: num.to_i + 1)
    else
      slug
    end
  end
end
