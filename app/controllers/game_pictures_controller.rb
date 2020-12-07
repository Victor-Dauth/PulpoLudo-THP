class GamePicturesController < ApplicationController

  before_action :authenticate_user!
  #ecrire un before action update uniquement accécilble a l'admin
  
  def create
    @game_sheet = GameSheet.find(params[:game_sheet_id])
    @game_sheet.game_picture.attach(params[:game_picture])
    redirect_to(game_sheet_path(@game_sheet))
  end
end
