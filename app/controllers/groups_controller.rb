class GroupsController < ApplicationController
  before_action :group_group, only: %i[show]
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.asc
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      flash[:success] = "#{@group.name} Group was created successfully"
      redirect_to groups_path
    else
      flash.now[:error] = @group.errors.full_messages
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:success] = 'Group name was successfully updated'
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def show
    if current_user.groups.include? @group
      @groups = nil
      @groups = @group.groups.desc if @group.groups.exists?
    else
      flash[:danger] = 'You are not allowed to view other users groups'
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
