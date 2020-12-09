class Admin::GameSheetsController < Admin::BaseController
  
  def index
    @game_sheets = GameSheet.all
  end

  def create

  end

  def update

  end

  def destroy
    
  end
end