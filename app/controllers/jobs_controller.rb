class JobsController < ApplicationController

  before_filter :login_required
  access_control :DEFAULT => 'scheduler'

  def list
    @jobs = current_user.created_jobs
  end

  def new
    
  end

  def list_registrants
    @result = @organization.filter_registrants(params[:service],params[:location])
    @registrants = @result[:registrants]
    @service = @result[:service]
    @location = @result[:location]
    render :json => {:success => true, :html => render_to_string(:partial => "/jobs/list_registrants.html") }.to_json
  end

  def schedule
    @clients = @organization.clients
    @registrant = User.find_by_id(params[:id])
    @service = params[:service]
    @location = params[:location]
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    @client = User.find_by_id(params[:client_id])
    @registrant = User.find_by_id(params[:registrant_id])
    @job.client = @client
    @job.registrant = @registrant
    @job.creator = current_user

    if @job.save
      flash[:notice]  = "Job was successfully created"
      redirect_to :action => :list
    else
      flash[:error]  = "Sorry! Job was not created. Please try again."
      @clients = @organization.clients
      @service = params[:job][:facility]
      @location = params[:job][:location]
      render :action => :schedule
    end

  end

  def delete
    @job = Job.find_by_id(params[:id])
    @job.destroy
    flash[:notice]  = "Job was successfully deleted"
    redirect_to :action => :list
  end

end
