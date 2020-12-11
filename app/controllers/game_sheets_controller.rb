class GameSheetsController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  
  def index
    @game_sheets = all_game_sheets_in_stock
  end

  def show
    @game_sheet = GameSheet.find(params[:id])
    @game_sheets_rand = GameSheet.all.reject {|game_sheet| game_sheet == @game_sheet }.sample(3)
  end

  private 

  def all_game_sheets_in_stock
    games = Game.in_stock
    game_sheets = []

    games.each do |game|
      game_sheets.push(game.game_sheet) unless game_sheets.include?(game.game_sheet)
    end

    return game_sheets
  end
end
