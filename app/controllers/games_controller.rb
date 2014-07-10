class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @cols = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] # refactor to constants
    @rows = (1..8).to_a.reverse.each { |e| e.to_s }
    @moves = @game.moves
    @white_player = @game.participations.find_by_color("White").player.name
    @black_player = @game.participations.find_by_color("Black").player.name
  end
end
