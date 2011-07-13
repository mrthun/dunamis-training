class ProfilesController < ApplicationController

  def personal_data
    @personal_data = current_user.personal_data.present? ? current_user.personal_data : PersonalData.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/personal_data.html") }.to_json
    end
  end

  def skills
    @skill = current_user.skill.present? ? current_user.skill : Skill.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/skills.html") }.to_json
    end
  end

  def preferences
    @preference = current_user.preference.present? ? current_user.preference : Preference.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/preferences.html") }.to_json
    end
  end

  def pays
    @pay = current_user.pay.present? ? current_user.pay : Pay.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/pays.html") }.to_json
    end
  end

  def credentials
    @credential = current_user.credential.present? ? current_user.credential : Credential.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/credentials.html") }.to_json
    end
  end

  def locations
    @location = current_user.work_location.present? ? current_user.work_location : WorkLocation.new(:registrant => current_user)
    if request.xhr?
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/locations.html") }.to_json
    end
  end

end
