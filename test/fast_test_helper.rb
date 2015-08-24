require "minitest/autorun"
require "minitest/mock"
require "minitest/pride"

require_relative "support/test_board_repository"

class GoflFastTest < Minitest::Test
  def setup
    Board.repository = TestBoardRepository
  end

  def teardown
    Board.repository = nil
  end
end
