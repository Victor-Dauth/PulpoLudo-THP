class GameSheetsController < ApplicationController
  def index
    @game_sheets = GameSheet.all
  end

  def show
    @game_sheet = GameSheet.find(params[:id])
  end
end
