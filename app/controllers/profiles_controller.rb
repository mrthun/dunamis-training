class ProfilesController < ApplicationController

  before_filter :login_required
  access_control :DEFAULT => 'registrant'

  def my_profile
    if request.xhr? && params[:link].present?
      case params[:link]
      when "personal_data"
        @resource = current_user.personal_data.present? ? current_user.personal_data : PersonalData.new
      when "skills"
        @resource = current_user.skill.present? ? current_user.skill : Skill.new
      when "preferences"
        @resource = current_user.preference.present? ? current_user.preference : Preference.new
      when "pays"
        @resource = current_user.pay.present? ? current_user.pay : Pay.new
      when "credentials"
        @resource = current_user.credential.present? ? current_user.credential : Credential.new
      when "locations"
        @resource = current_user.work_location.present? ? current_user.work_location : WorkLocation.new
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
    else
      @resource = current_user.personal_data.present? ? current_user.personal_data : PersonalData.new
    end
  end

  def create_personal_data
    if current_user.personal_data.present?
      @resource = current_user.personal_data
      success = @resource.update_attributes(params[:resource])
    else
      @resource = PersonalData.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.skill.present? ? current_user.skill : Skill.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_skill
    if current_user.skill.present?
      @resource = current_user.skill
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Skill.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.preference.present? ? current_user.preference : Preference.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_preference
    if current_user.preference.present?
      @resource = current_user.preference
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Preference.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.pay.present? ? current_user.pay : Pay.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
 
  end

  def create_pay
    if current_user.pay.present?
      @resource = current_user.pay
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Pay.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.credential.present? ? current_user.credential : Credential.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_credential
    if current_user.credential.present?
      @resource = current_user.credential
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Credential.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.work_location.present? ? current_user.work_location : WorkLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def create_location
    if current_user.work_location.present?
      @resource = current_user.work_location
      success = @resource.update_attributes(params[:resource])
    else
      @resource = WorkLocation.new(params[:resource])
      @resource.registrant_id = current_user.id
      @resource.registrant_type = current_user.class.name
      success = @resource.save
    end
    if success
      @resource = current_user.personal_data.present? ? current_user.personal_data : PersonalData.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/profiles/profile.html") }.to_json
  end

  def upload_asset
    if params[:asset].present?
      if current_user.has_asset?(params[:key])
        current_user.remove_asset(params[:key])
      end
      @asset = Asset.new(params[:asset])
      @asset.user = current_user
      @asset.asset_asset_type = "#{params[:key]}"
      if @asset.save && @asset.errors.empty?
        render :text => @asset.asset.asset_file_name
      else
        render :text => @asset.errors
      end
    end
  end

end
