require_relative "../fast_test_helper"
require_relative "../../app/processors/share_board"
require_relative "../../app/models/board"

class TestShareBoard < GoflFastTest
  def test_success
    response = ShareBoard.share(name: "Test Board", board: { "0" => "false,true", "1" => "true,false" })
    response.success do |board|
      assert_equal [[false, true], [true, false]], board.board
      assert_equal "Test Board", board.name
    end
    refute response.error
  end

  def test_error
    TestBoardRepository.should_save = false
    response = ShareBoard.share(name: "Test Board", board: { "0" => "false,true", "1" => "true,false" })
    response.error do |board|
      assert_equal "Test Board", board.name
    end
    refute response.success
    TestBoardRepository.should_save = true
  end
end
