class OrganizationsController < ApplicationController

  before_filter :login_required, :only => [:list, :reports]
  access_control [:list, :all_reports] => 'admin'
  access_control :reports => 'organization'

  def list
    @organizations = User.organizations
  end

  def dashboard

  end

  def all_reports
    @organizations = User.organizations
  end

  def reports
  end

  def history
    @organization = User.find_by_id(params[:id])
    render :json => {:success => true, :html => render_to_string(:partial => "/organizations/report.html") }.to_json
  end

  def statistics
    @org = params[:id].present? ? User.find_by_id(params[:id]) : @organization
  end

  
end
