class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    # @name = params[:name]
    # Task.create(name: @name)
    # @task = Task.new(task_params)
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit
    # @task = Task.find(params[:id])
    set_task
  end

  def update
    # @task = Task.find(params[:id])
    set_task
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    # @task = Task.find(params[:id])
    set_task
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
