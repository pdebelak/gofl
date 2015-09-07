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
    response = CreateBoard.create(board_params)
    response.success do |board|
      redirect_to board_path(board.slug)
    end
    response.error do
      redirect_to :back
    end
  end

  private

  def board_params
    { name: params[:board][:name], board: params[:board][:board] }
  end
end
