class Admin::GameSheetsController < Admin::BaseController
  
  def index
    @game_sheets = GameSheet.all
    @column_names = GameSheet.column_names
    @column_names_non_visible = []

  end

  def create

  end

  def update

  end

  def destroy
    
  end
end