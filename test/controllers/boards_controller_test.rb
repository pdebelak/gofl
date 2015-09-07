require "test_helper"

class BoardsControllerTest < ActionController::TestCase

  def setup
    @request.env["HTTP_REFERER"] = root_path
    @board = Board.new(name: "Test Board", board: [[false],[true]])
  end

  def teardown
    BoardRepository.destroy_all
  end

  def params(name: @board.name, board: { "0" => "false", "1" => "true" })
    { name: name, board: board }
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

  def test_create_creates_board
    post :create, board: params
    new_board = BoardRepository.last.to_board
    assert_equal @board.name, new_board.name
    assert_equal @board.board, new_board.board
  end

  def test_create_redirects_to_board
    post :create, board: params
    assert_redirected_to board_path(BoardRepository.last.slug)
  end

  def test_create_renders_show_without_save
    post :create, board: params(name: nil)
    assert_template :show
  end

  def test_assigns_board_and_board_for_form_without_save
    post :create, board: params(name: nil)
    assert_equal assigns(:board), assigns(:board_for_form)
  end
end
