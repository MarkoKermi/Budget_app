class GroupsController < ApplicationController

  before_action :authenticate_user!
  
  def index 
    @user = current_user
    @groups = Group.all
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @payments = @group.payments.order('created_at DESC')
  end

  def new
    # @group = current_user.groups.new
    @user = current_user
    @group = Group.new
    
  end

  def create
    @user = current_user
    group = Group.new(
      name: new_group_params['name'],
      icon: new_group_params['icon'],
      user_id: current_user.id
     )
     if group.save
      flash[:success] = 'Category was created successfully'
      redirect_to user_groups_path(user_id: current_user.id)
     else
      flash[:alert] = 'Category was not created'
     end
    # @user = current_user
    # @group = current_user.groups.new(new_group_params)
    # @group.user_id = @user.id

    # if @group.save
    #   redirect_to user_groups_path, notice: 'Group was successfully created.'
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def new_group_params
    params.require(:new_group).permit(:name, :icon)
  end

end
