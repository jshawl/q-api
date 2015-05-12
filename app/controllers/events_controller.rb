class EventsController < ApplicationController
  def index
    @events = current_user.groups.find(params[:group_id]).tasks.find(params[:task_id]).events
    render json: @events
  end
end