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
  private
  def group_params
    params.permit(:name)
  end


end
