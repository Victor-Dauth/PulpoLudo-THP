module GameSheetsHelper

  def game_in_stock?(game_sheet)
    game_sheet.games.each do |game|
      return true if game.in_stock?
    end

    return false
  end
end