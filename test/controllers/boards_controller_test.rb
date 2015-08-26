require "test_helper"

class BoardsControllerTest < ActionController::TestCase

  def setup
    @board = Board.new(name: "Test Board", board: [[false],[true]])
  end

  def load_stubbed(&block)
    Board.stub(:load, @board, &block)
  end

  def test_show_finds_board_by_slug
    @board.share
    get :show, id: @board.slug
    assert_equal @board.name, assigns(:board).name
    assert_equal @board.board, assigns(:board).board
  end

  def test_show_has_standard_layout
    load_stubbed do
      get :show, id: @board.slug
      assert_template layout: "layouts/application"
    end
  end

  def test_show_has_no_layout_with_xhr
    load_stubbed do
      xhr :get, :show, id: @board.slug
      assert_template layout: false
    end
  end

  def test_find_redirects_to_show_route
    load_stubbed do
      post :find, slug: @board.slug
      assert_redirected_to board_path(@board.slug)
    end
  end
end
