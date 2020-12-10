class Admin::GameSheetsController < Admin::BaseController
  
  def index
    @game_sheets = GameSheet.all
    @column_names = GameSheet.column_names
    @column_names_non_visible = []

    @urls_d = []
    @urls_e = []
    @game_sheets.each do |game_sheet|
      @urls_d << admin_game_sheet_path(game_sheet)
      @urls_e << edit_admin_game_sheet_path(game_sheet)
    end

  end

  def new

  end

  def create

  end

  def edit

  end
  
  def update

  end

  def destroy
    
  end
end