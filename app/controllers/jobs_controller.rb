class JobsController < ApplicationController
  before_filter :login_required
  access_control :DEFAULT => 'scheduler'

  def list
    @jobs = current_user.created_jobs
  end

  def new
    @registrant = User.registrants
  end

  def list_registrants
    # TODO: need to do searching here.....
    @registrant = User.registrants
    render :json => {:success => true, :html => render_to_string(:partial => "/jobs/list_registrants.html") }.to_json
  end

  def schedule

  end

  def destroy
    @job = Job.find_by_id(params[:id])
    @job.destroy
    redirect_to :action => :list
  end

end
