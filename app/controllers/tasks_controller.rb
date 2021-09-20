class TasksController < ApplicationController
  before_action :set_task, only:[:show,:edit,:update,:destroy]
    
  def index
    @pagy,@tasks = pagy(Task.order(id: :asc), items:5)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスク内容の登録が完了しました！'
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
      flash[:success] = "内容を更新しました！"
      redirect_to @task
    else
      flash.now[:danger] = '更新できませんでした。もう一度入力してください。'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'タスクの内容を削除しました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
end
