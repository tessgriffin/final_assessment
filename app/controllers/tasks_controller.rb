class TasksController < ApplicationController
  respond_to :json

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    if @task.save
      flash[:success] = "#{@task.title} created"
      redirect_to list_path(params[:list_id])
    else
      flash.now[:error] = @task.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "#{@task.title} updated"
      redirect_to list_path(params[:list_id])
    else
      flash[:errors] = @task.errors.full_messages.join(", ")
      render :edit
    end 
  end

  def toggle_status
    @task = Task.find(params[:id])
    @task.update_attributes(complete: !@task.complete)
    respond_with @task, location: ""
  end

  def delete_image
    @task = Task.find(params[:id])
    @task.image = nil
    @task.save!
    respond_with @task
  end

  private
  def task_params
    params.require(:task).permit(:title, :notes, :start_date, :due_date, :complete, :image)
  end
end