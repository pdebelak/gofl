class BoardRepository < ActiveRecord::Base
  serialize :board

  validates_uniqueness_of :slug

  class << self
    def load_from_attributes(attributes)
      found = find_by(attributes)
      found.to_board if found
    end

    def slug_taken?(slug)
      !!load_from_attributes(slug: slug)
    end
  end

  def to_board
    Board.new(name: name, board: board, slug: slug)
  end
end
