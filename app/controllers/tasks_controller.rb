class TasksController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.page(params[:page])
  end
  
  def show
  end
  
  def new
    # @task = Task.new
    @task = current_user.tasks.build
  end
  
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'taskが正常に投稿されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'taskが投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end
  
  
  def destroy
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to root_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = Task.find(params[:id])
    redirect_to root_url if @task.user != current_user
  end
end
