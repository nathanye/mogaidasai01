class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
    if current_user.has_applied?(@job)
        flash[:warning] = "You can't push resume again!"
        redirect_to job_path(@job)
    end
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      flash[:notice] = "成功提交履历"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def check_permission
     @job = Job.find(params[:job_id])
     if current_user.admin?
       flash[:warning] = "Only normal user can push resume"
       redirect_to job_path(@job)
     end
   end

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
