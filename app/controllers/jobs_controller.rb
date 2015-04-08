class JobsController < ApplicationController
  respond_to :js

  def index
    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: JobDatatable.new(view_context) }
    end
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = 'New job added to queue'
      render 'create_success', locals: { message: 'New job added to queue' }
    else
      render 'create_error', locals: { message: 'Error occurred while create job' }
    end
  end

  private

  def job_params
    params[:job][:host_ids] ||= []
    params[:job][:credential_ids] ||= []
    params.require(:job).permit(:name, host_ids: [], credential_ids: [])
  end
end
