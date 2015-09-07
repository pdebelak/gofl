class ShareBoard
  def self.share(name:, board:)
    new(name: name, board: board).share
  end

  def initialize(name:, board:)
    @name = name
    @board = board
  end

  def share
    if created_board.share
      @success = true
    end
    return self
  end

  def success(&block)
    block.call(created_board) if success?
  end

  def error(&block)
    block.call(created_board) unless success?
  end

  private

  attr_reader :name

  def created_board
    @_created_board ||= Board.new(name: name, board: board_params)
  end

  def board_params
    [].tap do |board|
      @board.each do |index, row|
        board << row.split(",").map { |val| val == "true" ? true : false }
      end
    end
  end

  def success?
    !!@success
  end
end
