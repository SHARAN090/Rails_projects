class TasksController < ApplicationController
  skip_forgery_protection only: :create

  def index
    @tasks = Task.view_tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create_task(
      task_params[:name],
      task_params[:description],
      task_params[:due_date],
      task_params[:category],
      task_params[:priority]
    )

    if @task.persisted?
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_task(
      task_params[:name],
      task_params[:description],
      task_params[:due_date],
      task_params[:category],
      task_params[:priority]
    )
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.delete_task

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :description,
      :due_date,
      :category,
      :priority
    )
  end

end
