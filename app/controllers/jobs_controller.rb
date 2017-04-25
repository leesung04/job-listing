class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

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
   @job = Job.find(params[:id])
   if current_user != @job.user
     redirect_to root_path, alert: "对不起， 您没有访问权限！"
   end
  end


  def update
   @job = Job.find(params[:id])
   if current_user != @job.user
     redirect_to root_path, alert: "对不起， 您没有访问权限！"
   end
   if @job.update(job_params)
   redirect_to jobs_path, notice: "修改成功"
   else
     render :edit
   end
  end


  def destroy
    @job = Job.find(params[:id])
    if current_user != @job.user
      redirect_to root_path, alert: "对不起， 您没有访问权限！"
    end
    @job.destroy
    flash[:alert] = "职位已删除"
    redirect_to jobs_path
  end


  private
  def job_params
    params.require(:job).permit(:title, :description, :max, :min, :email)
  end


end
