class TasksController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to "/", notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def show
    # find
  end

  def edit
    # find
  end

  def update
    # find
    if @task.update(task_params)
      redirect_to "/", notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # find
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:completed, :title, :details)
  end

end
