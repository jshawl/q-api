class TasksController < ApplicationController
  def index
    @tasks = current_user.groups.find(params[:group_id]).tasks
    render json: @tasks
  end
  def show
    @task = current_user.groups.find(params[:group_id]).tasks.find(params[:id])
    render json: @task
  end
  def create
    @task = current_user.groups.find(params[:group_id]).tasks.new(name: params[:name])
    if @task.save
      render json: @task
    else
      render json: { error: @task.errors }
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render nothing: true
  end
  def next_user
    @task = Task.find(params[:id])
    @user = @task.next_user
    render json: @user
  end
end
