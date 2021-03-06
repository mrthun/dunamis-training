class RegistrantsController < ApplicationController

  before_filter :login_required, :set_registrant
  access_control :jobs_history => "( admin | registrant | organization )",
    [:profile, :create_personal_data, :create_skill, :create_preference,
    :create_pay, :create_credential, :create_location, :remove_location,
    :upload_asset ] => "( organization | registrant )"


  def profile
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if request.xhr? && params[:link].present?
      case params[:link]
      when "personal_data"
        @resource = @registrant.personal_data.present? ? @registrant.personal_data : PersonalData.new
      when "skills"
        @resource = @registrant.skill.present? ? @registrant.skill : Skill.new
      when "preferences"
        @resource = @registrant.preference.present? ? @registrant.preference : Preference.new
      when "pays"
        @resource = @registrant.pay.present? ? @registrant.pay : Pay.new
      when "credentials"
        @resource = @registrant.credential.present? ? @registrant.credential : Credential.new
      when "locations"
        @locations = @registrant.work_locations
        @resource = WorkLocation.new
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
    else
      @resource = @registrant.personal_data.present? ? @registrant.personal_data : PersonalData.new
    end
  end

  def create_personal_data
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @registrant.personal_data.present?
      @resource = @registrant.personal_data
      success = @resource.update_attributes(params[:resource])
    else
      @resource = PersonalData.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    if success
      @resource = @registrant.skill.present? ? @registrant.skill : Skill.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def create_skill
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @registrant.skill.present?
      @resource = @registrant.skill
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Skill.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    if success
      @resource = @registrant.preference.present? ? @registrant.preference : Preference.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def create_preference
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @registrant.preference.present?
      @resource = @registrant.preference
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Preference.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    if success
      @resource = @registrant.pay.present? ? @registrant.pay : Pay.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
 
  end

  def create_pay
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @registrant.pay.present?
      @resource = @registrant.pay
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Pay.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    @registrant.update_attribute(:status_id,Status.find_by_title("missing_credentials").id)
    if success
      @resource = @registrant.credential.present? ? @registrant.credential : Credential.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def create_credential
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if @registrant.credential.present?
      @resource = @registrant.credential
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Credential.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    @registrant.update_attribute(:status_id,Status.find_by_title("do_not_schedule").id)
    if success
      @locations = @registrant.work_locations
      @resource = WorkLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def create_location
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    @resource = WorkLocation.new(params[:resource])
    @resource.registrant = @registrant
    success = @resource.save
    @locations = @registrant.work_locations
    if success
      @registrant.update_attribute(:status_id,params[:status_id]) if params[:status_id].present?
      @resource = WorkLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def remove_location
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    @loc = WorkLocation.find_by_id(params[:id])
    @locations = @registrant.work_locations
    if @loc.destroy
      @registrant.update_attribute(:status_id,params[:status_id]) if params[:status_id].present?
      @resource = WorkLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/registrants/profile.html") }.to_json
  end

  def upload_asset
    current_user.is_organization? ? set_active_tab("hr") : set_active_tab("profile")
    if params[:asset].present?
      if @registrant.has_asset?(params[:key])
        @registrant.remove_asset(params[:key])
      end
      @asset = Asset.new(params[:asset])
      @asset.user = @registrant
      @asset.asset_asset_type = "#{params[:key]}"
      if @asset.save && @asset.errors.empty?
        render :text => @asset.asset.original_filename
      else
        render :text => @asset.errors
      end
    end
  end

  def jobs_history
    set_active_tab("reports")
    @jobs = @registrant.assigned_jobs
  end

  private
  
  def set_registrant
    @registrant = User.find_by_id(params[:r_id])
  end

end
