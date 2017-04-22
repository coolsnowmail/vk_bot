class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin

  def show
    return render partial: 'showy'
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = @current_user.build_task(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to user_url(@current_user.id), notice: t('tasks.task created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_url(@current_user.id), notice: t('tasks.task updated') }
        format.js
      else
        format.js
      end
    end
  end

  def refresh_part
    return render partial: 'tasks/refresh_part'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description)
    end
end
