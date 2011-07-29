class SchedulersController < ApplicationController
  before_filter :login_required, :set_scheduler
  access_control :jobs_history => "( admin | organization | scheduler ) ",
    [:profile, :create_profile_data] => "( organization | scheduler )"

  def profile
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    @resource = @scheduler.profile_data.present? ? @scheduler.profile_data : ProfileData.new
  end

  def create_profile_data
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @scheduler.profile_data.present?
      @resource = @scheduler.profile_data
      @resource.update_attributes(params[:resource])
    else
      @resource = ProfileData.new(params[:resource])
      @resource.scheduler = @scheduler
      @resource.save
    end
    @scheduler.update_attribute(:status_id, Status.find_by_title("active").id)
    redirect_to :action => :profile, :s_id => @scheduler.id
  end

  def jobs_history
    set_active_tab("reports")
    @jobs = @scheduler.created_jobs
  end

  private

  def set_scheduler
    @scheduler = User.find_by_id(params[:s_id])
  end

end
