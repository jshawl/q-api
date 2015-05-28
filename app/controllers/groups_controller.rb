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
    name = group_params[:name]
    hashids = Hash
    hashids = Hashids.new(ENV['hashids_salt'],3,"abcdefghijklmnopqrstuvwxyz1234567890")
    decoded = hashids.decode(group_params[:name])
    if decoded.empty?
      @group = current_user.groups.create group_params
    else
      @group = Group.find(decoded[0])
    end
    render json: @group
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
