class JobsController < ApplicationController

  before_filter :login_required
  access_control :DEFAULT => 'scheduler'

  def list
    @jobs = current_user.created_jobs
    if request.xhr?
      @sent_data = []
      @jobs.each do |job|
        @sent_data << {:id => job.id,
          :start => "#{job.date.iso8601}",
          :end => "#{(job.date  + job.hours.hours).iso8601}" ,
          :title =>  "Facility: #{job.facility.titleize}"
        }
      end
      render :text => @sent_data.to_json
    end
  end

  def details
    @job = Job.find_by_id(params[:id])
    render :json => {:success => true, :html => render_to_string(:partial => "/jobs/details.html") }.to_json
  end

  def update_job
    @job = Job.find_by_id(params[:id])
    if params[:key] == "date"
      @job.update_attribute(:date, @job.date + (params[:days].to_i*24).hours )
    elsif params[:key] == "hours"
      @job.update_attribute(:hours, @job.hours + (params[:days].to_i*24))
    end
    @jobs = current_user.created_jobs
    render :json => {:success => true, :html => render_to_string(:partial => "/jobs/list.html", :locals => {:jobs => @jobs} ) }
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
