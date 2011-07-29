class OrganizationsController < ApplicationController

  before_filter :login_required
  access_control [:reports,:dashboard] => "organization",
    [:list, :new, :create, :change_status,
    :delete_organization, :all_reports ] => "admin",
    [:statistics, :history ] => "( admin | organization )"


  def list
    set_active_tab("organizations")
    @organizations = User.organizations
  end
  
  def new
    set_active_tab("organizations")
    @org = User.new
  end

  def create
    set_active_tab("organizations")
    @org = User.new(params[:org])
    @org.roles << Role.find_by_title("organization")
    @org.subdomain = Subdomain.new :name => params[:org][:name].downcase

    success = @org && @org.save

    if success && @org.errors.empty?
      if params[:asset].present?
        @asset = Asset.new(:asset => params[:asset])
        @asset.user = @org
        @asset.asset_asset_type = "#{params[:key]}"
        @asset.save!
      end
      flash[:notice]  = "New Organization was created. An Email has been sent to created organization with activation code."
      redirect_to :action => :list
    else
      flash[:error]  = "We couldn't set up that organization, sorry.  Please try again later."
      render :action => 'new'
    end
  end

  def change_status
    set_active_tab("organizations")
    organization = User.find_by_id(params[:id])
    organization.activate! unless organization.activation_code.nil?
    organization.update_attribute(:status_id, Status.find_by_title(params[:key].to_s).id)
    redirect_to :action => :list
  end

  def delete_organization
    set_active_tab("organizations")
    organization = User.find_by_id(params[:id])
    organization.destroy
    redirect_to :action => :list
  end

  def dashboard
    set_active_tab("home")
  end

  def all_reports
    set_active_tab("reports")
    @organizations = User.organizations
  end

  def reports
    set_active_tab("reports")
    @org = @organization
  end

  def history
    set_active_tab("reports")
    @org = User.find_by_id(params[:id]) 
    render :json => {:success => true, :html => render_to_string(:partial => "/organizations/report.html") }.to_json
  end

  def statistics
    current_user.is_admin? ?  set_active_tab("reports") : set_active_tab("statistics")
    @org = params[:id].present? ? User.find_by_id(params[:id]) : @organization
  end

  
end
