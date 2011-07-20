class ProfilesController < ApplicationController

  before_filter :login_required, :set_registrant
  access_control :DEFAULT => 'registrant'

  def my_profile
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
        @resource = @registrant.work_location.present? ? @registrant.work_location : WorkLocation.new
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
    else
      @resource = @registrant.personal_data.present? ? @registrant.personal_data : PersonalData.new
    end
  end

  def create_personal_data
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
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_skill
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
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_preference
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
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
 
  end

  def create_pay
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
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_credential
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
      @resource = @registrant.work_location.present? ? @registrant.work_location : WorkLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_location
    if @registrant.work_location.present?
      @resource = @registrant.work_location
      success = @resource.update_attributes(params[:resource])
    else
      @resource = WorkLocation.new(params[:resource])
      @resource.registrant = @registrant
      success = @resource.save
    end
    @registrant.update_attribute(:status_id,params[:status_id]) if params[:status_id].present?
    if success
      @resource = @registrant.personal_data.present? ? @registrant.personal_data : PersonalData.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def upload_asset
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

  private
  
  def set_registrant
    @registrant = current_user
  end

end
