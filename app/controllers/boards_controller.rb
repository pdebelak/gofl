class BoardsController < ApplicationController
  def show
    @board = Board.load(slug: params[:id])
    render layout: !request.xhr?
  end

  def find
    @board = Board.load(slug: params[:slug])
    redirect_to board_path(@board.slug)
  end
end
