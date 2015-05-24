class EventsController < ApplicationController
  def index
    task = current_user.groups.find(params[:group_id]).tasks.find(params[:task_id])
    @events = task.events
    render json: @events
  end
  def create
    @event = current_user.groups.find(params[:group_id]).tasks.find(params[:task_id]).events.create( user_id: current_user.id )
    render json: @event
  end
end