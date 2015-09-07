class BoardRepository < ActiveRecord::Base
  validates_uniqueness_of :slug
  validates_presence_of :name
  validates_presence_of :board

  class << self
    def load(slug:)
      found = find_by(slug: slug)
      found.to_board if found
    end

    def slug_taken?(slug)
      !!load(slug: slug)
    end

    def examples
      where(board_type: "example").map(&:to_board)
    end
  end

  def initialize(args)
    @example = args[:example]
    args = handle_args(args)
    super(args)
  end

  def to_board
    Board.new(name: name, board: board, slug: slug, example: example)
  end

  private

  EXAMPLE = "example"

  def example
    @example ||= board_type == EXAMPLE
  end

  def handle_args(args)
    args.dup.tap do |args|
      args[:board_type] = EXAMPLE if args[:example]
      args.delete(:example)
    end
  end
end
