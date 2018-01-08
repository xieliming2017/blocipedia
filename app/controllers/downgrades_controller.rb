class DowngradesController < ApplicationController

  def new
  end

  def create
    current_user.update_attribute(:role, 'standard')
    wikis = current_user.wikis
    wikis.each do |wiki|
      wiki.update_attribute(:private, false) if wiki.private == true
    end

    flash[:notice] = "You have successfully downgraded your account."
    redirect_to user_path(current_user)
  end
end
