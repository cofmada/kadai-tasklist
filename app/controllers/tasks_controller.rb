class TasksController < ApplicationController
    
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "内容を更新しました！"
      redirect_to @task
    else
      flash.now[:danger] = '更新できませんでした。もう一度入力してください。'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクの内容を削除しました'
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end
