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
    @game_sheet = GameSheet.new
  end

  def create
    @game_sheet = GameSheet.new(game_sheet_params)

    if @game_sheet.save
      flash[:notice] = "le profil de l'ustilisateur n°#{@game_sheet.id} a été mis à jour"
      redirect_to(admin_game_sheets_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@game_sheet.id} n'ont pas put être enregistré"
      render :new
    end
  end

  def edit
    @game_sheet = GameSheet.find(params[:id])
  end

  def update
    @game_sheet = GameSheet.find(params[:id])

    if @game_sheet.update(game_sheet_params)
      flash[:notice] = "le profil de l'ustilisateur n°#{@game_sheet.id} a été mis à jour"
      redirect_to(admin_game_sheets_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@game_sheet.id} n'ont pas put être enregistré"
      render :edit
    end
  end

  private
  
  def game_sheet_params
    params.require(:game_sheet).permit(:title, :description, :nb_players_min, :nb_players_max, :playing_time, :age_min, :language,:publication_date, :difficulty, :game_picture)
  end
end