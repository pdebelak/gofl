class StaticPagesController < ApplicationController
  def home
    @board = Board.generate(height: 40, width: 60)
  end
end
