class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.all
  end


  def show
    @job = Job.find(params[:id])
  end


  def new
    @job = Job.new
  end


  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end


  def edit
  end


  def update
   if @job.update(job_params)
   redirect_to jobs_path, notice: "修改成功"
   else
     render :edit
   end
  end


  def destroy
    @job.destroy
    redirect_to jobs_path, alert: "职位已删除"
  end


  private
  def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: “对不起，您没有访问权限！”
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :max, :min, :email)
  end


end
