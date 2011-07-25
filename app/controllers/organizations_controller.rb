class OrganizationsController < ApplicationController

  before_filter :login_required, :only => [:list, :reports]
  access_control [:list, :all_reports, :new, :create, :change_status] => 'admin'
  access_control :reports => 'organization'


  def list
    @organizations = User.organizations
  end
  
  def new
    @org = User.new
  end

  def create
    @org = User.new(params[:org])
    @org.roles << Role.find_by_title("organization")
    @org.subdomain = Subdomain.new :name => params[:org][:name].downcase

    success = @org && @org.save

    if success && @org.errors.empty?
      flash[:notice]  = "New Organization was created. An Email has been sent to created organization with activation code."
      redirect_to :action => :list
    else
      flash[:error]  = "We couldn't set up that organization, sorry.  Please try again later."
      render :action => 'new'
    end
  end

  def change_status
    @organization = User.find_by_id(params[:id])
    @organization.activate! unless @organization.activation_code.nil?
    @organization.update_attribute(:status_id, Status.find_by_title(params[:key].to_s).id)
    redirect_to :action => :list
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
