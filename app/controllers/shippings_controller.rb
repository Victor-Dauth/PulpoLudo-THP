class ShippingsController < ApplicationController

  before_action :authenticate_user!
  before_action :good_user?
  #ecrire un before action pour le show et update qui vérifie que l'utilisateur vas bien sur un shipping retour en cours et pas un shipping aller ou un shipping retour fini
  
  def show
  end

  def update

    #changer status shipping
    #changer status jeux
    #envoyer mails de confirmation
    
  end

  private 

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end
end
