class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    render json: @groups
  end
end
