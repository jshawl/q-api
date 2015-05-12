class TasksController < ApplicationController
  def index
    @tasks = current_user.groups.find(params[:group_id]).tasks
    render json: @tasks
  end
  def show
    @task = current_user.groups.find(params[:group_id]).tasks.find(params[:id])
    render json: @task
  end
end
