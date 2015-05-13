class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    render json: @groups
  end
  def show
    @group = current_user.groups.find(params[:id])
    render json: @group
  end
  def create
    @group = current_user.groups.create group_params
    if @group
      render json: @group
    end
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    render nothing: true
  end
  def update
    @group = Group.find(params[:id])
    if @group.update( group_params )
      render json: @group
    else
      render json: { errors: @group.errors.full_messages }
    end
  end
  private
  def group_params
    params.permit(:name)
  end


end
