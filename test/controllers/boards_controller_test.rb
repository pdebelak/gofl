require "test_helper"

class BoardsControllerTest < ActionController::TestCase

  def setup
    Board.new(name: "Test Board", board: [[false],[true]]).publish
  end

  def test_show_finds_board_by_slug
    board = Board.load(name: "Test Board")
    get :show, id: board.slug
    assert_equal board.name, assigns(:board).name
    assert_equal board.board, assigns(:board).board
  end

  def test_show_has_standard_layout
    board = Board.load(name: "Test Board")
    get :show, id: board.slug
    assert_template layout: "layouts/application"
  end

  def test_show_has_no_layout_with_xhr
    board = Board.load(name: "Test Board")
    xhr :get, :show, id: board.slug
    assert_template layout: false
  end

  def test_find_redirects_to_show_route
    board = Board.load(name: "Test Board")
    post :find, slug: board.slug
    assert_redirected_to board_path(board.slug)
  end
end
