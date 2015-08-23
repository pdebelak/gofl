class Board
  class << self
    attr_writer :repository

    def load(attributes)
      repository.load_from_attributes(attributes)
    end

    def examples
      repository.examples
    end

    def repository
      @repository ||= BoardRepository
    end
  end

  attr_reader :name, :board

  def initialize(name: nil, board: nil, slug: nil, example: false, board_type: nil)
    @name = name
    @board = board
    @slug = slug
    @example = example
    @board_type = board_type
  end

  def publish
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
    @example ||= @board_type == "example"
  end

  private

  def board_type
    @board_type ||= set_type
  end

  def set_type
    "example" if @example
  end

  def repository
    self.class.repository
  end

  def as_repository
    repository.new(name: name, board: board, slug: slug, board_type: board_type)
  end

  def calculate_slug(num: nil)
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
