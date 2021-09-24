class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:show,:edit,:update,:destroy]
    
  def index
    @pagy,@tasks = pagy(current_user.tasks.all, items:5)
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクの登録が完了しました！'
      redirect_to @task
    else
      flash.now[:danger] = '登録できませんでした。もう一度入力してください。'
      render :new
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      flash[:success] = "タスクを更新しました！"
      redirect_to @task
    else
      flash.now[:danger] = '更新できませんでした。もう一度入力してください。'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  private
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
