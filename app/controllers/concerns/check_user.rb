module CheckUser
  
  def check_user(user_id)
    if current_user.id != user_id.to_i
      flash[:warning] = "Bien essayé 😁"
      redirect_to(root_path) and return
    end
  end
end