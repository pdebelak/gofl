class BoardRepository < ActiveRecord::Base
  validates_uniqueness_of :slug

  class << self
    def load_from_attributes(attributes)
      found = find_by(attributes)
      found.to_board if found
    end

    def slug_taken?(slug)
      !!load_from_attributes(slug: slug)
    end

    def examples
      where(board_type: "example").map(&:to_board)
    end
  end

  def to_board
    Board.new(name: name, board: board, slug: slug, board_type: board_type)
  end
end
