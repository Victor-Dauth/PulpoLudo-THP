class Admin::GamesController < Admin::BaseController
  
  def index
    @games = Game.all

    @column_names = Game.column_names

    @column_names_non_visible = []

    @urls_d = []
    @urls_e = []
    @games.each do |game|
      @urls_d << admin_game_path(game)
      @urls_e << edit_admin_game_path(game)
    end
    
  end

  def new
    @game = Game.new
    @game_sheets = GameSheet.all
  end

  def create
    @game = Game.new(game_params)
    @game.stock_id = "#{@game.game_sheet.id}_#{@game.game_sheet.games.size + 1}"

    if @game.save
      flash[:notice] = "le profil de l'ustilisateur n°#{@game.id} a été mis à jour"
      redirect_to(admin_games_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@game.id} n'ont pas put être enregistré"
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    @game_sheets = GameSheet.all
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      flash[:notice] = "le profil de l'ustilisateur n°#{@game.id} a été mis à jour"
      redirect_to(admin_games_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@game.id} n'ont pas put être enregistré"
      render :edit
    end
  end

  private
  
  def game_params
    params.require(:game).permit(:status, :condition, :weight, :height, :lenght, :width, :game_sheet_id)
  end
end