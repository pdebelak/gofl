class BoardsController < ApplicationController
  def show
    @board = Board.load(slug: params[:id])
    render layout: !request.xhr?
  end
end
