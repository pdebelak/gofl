class BoardsController < ApplicationController
  def show
    @board = Board.load(slug: params[:id])
    render layout: !request.xhr?
  end

  def find
    @board = Board.load(slug: params[:slug])
    redirect_to board_path(@board.slug)
  end

  def create
    response = ShareBoard.share(board_params)
    response.success do |board|
      redirect_to board_path(board.slug)
    end
    response.error do |board|
      @board = board
      @board_for_form = board
      render :show
    end
  end

  private

  def board_params
    { name: params[:board][:name], board: params[:board][:board] }
  end
end
