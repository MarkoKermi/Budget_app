class GroupsController < ApplicationController

  before_action :authenticate_user!
  
  def index 
    @user = current_user
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @payments = @group.payments.order('created_at DESC')
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    group = Group.new(
      name: new_group_params['name'],
      icon: new_group_params['icon'],
      author_id: current_user.id
     )
     if group.save
      flash[:success] = 'Category was created successfully'
      redirect_to user_groups_path(author_id: current_user.id)
     else
      flash[:alert] = 'Category was not created'
     end
  end

  private

  def new_group_params
    params.require(:new_group).permit(:name, :icon, :author_id)
  end

end
