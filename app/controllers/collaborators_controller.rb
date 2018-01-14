class CollaboratorsController < ApplicationController

  def edit
    @users = User.all
    @wiki = Wiki.find(params[:id])
  end

  def update
    #find wiki to be updated
    @wiki = Wiki.find(params[:id])
    # read the list of user ids of all selected users
    @users_IDs_list = params[:user_IDs] || []
    #clear collaborators list before updating
    @wiki.update_attribute(:collaborators, [])
    unless @users_IDs_list.empty?#do nothing if no user was selected
      @users_IDs_list.each do |user_id|
        #there must be a better way than what I use here...
        Collaborator.create!(
          wiki_id: @wiki.id,
          user_id: user_id
        )
      end
    end
    redirect_to wiki_path(@wiki)
  end
end
