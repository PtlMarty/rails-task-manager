class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new(task_params)
    if @task.save
      redirect_to "/", notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
