class ProfilesController < ApplicationController

  def my_profile
    if request.xhr? && params[:link].present?
      case params[:link]
      when "personal_data"
        @resource = current_user.personal_data.present? ? current_user.personal_data : PersonalData.new(:registrant => current_user)
      when "skills"
        @resource = current_user.skill.present? ? current_user.skill : Skill.new(:registrant => current_user)
      when "preferences"
        @resource = current_user.preference.present? ? current_user.preference : Preference.new(:registrant => current_user)
      when "pays"
        @resource = current_user.pay.present? ? current_user.pay : Pay.new(:registrant => current_user)
      when "credentials"
        @resource = current_user.credential.present? ? current_user.credential : Credential.new(:registrant => current_user)
      when "locations"
        @resource = current_user.work_location.present? ? current_user.work_location : WorkLocation.new(:registrant => current_user)
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/profiles/#{params[:link]}.html") }.to_json
    end
  end

end
