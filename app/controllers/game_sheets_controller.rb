class GameSheetsController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  
  def index
    @game_sheets = GameSheet.all
  end

  def show
    @game_sheet = GameSheet.find(params[:id])
    @game_sheets_rand = GameSheet.all.reject {|game_sheet| game_sheet == @game_sheet }.sample(3)
  end
end
