class ClientsController < ApplicationController
  before_filter :login_required
  before_filter :set_client, :except => [:list, :new, :create ]
  access_control :jobs_history => '( admin | organization | scheduler )',
    [:list, :new, :create, :show, :create_basic_data,
    :create_addresses, :create_billing,
    :create_location, :remove_location] => "scheduler"
  

  def list
    @clients = User.clients
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.roles << Role.find_by_title("client")
    @user.organization = @organization
    @user.skip_activation = true
    success = @user && @user.save
    if success && @user.errors.empty?
      @user.activate!
      flash[:notice] = "A New Client has been created"
      redirect_to :action => :show, :c_id => @user.id
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again."
      render :action => 'new'
    end
  end

  def show
    if request.xhr? && params[:link].present?
      case params[:link]
      when "basic_data"
        @resource = @client.basic_data.present? ? @client.basic_data : BasicData.new
      when "addresses"
        @resource = @client.address.present? ? @client.address : Address.new
      when "billing"
        @resource = @client.billing_data.present? ? @client.billing_data : BillingData.new
      when "locations"
        @locations = @client.client_locations
        @resource = ClientLocation.new
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
    else
      @resource = @client.basic_data.present? ? @client.basic_data : BasicData.new
    end
  end

  def create_basic_data
    if @client.basic_data.present?
      @resource = @client.basic_data
      success = @resource.update_attributes(params[:resource])
    else
      @resource = BasicData.new(params[:resource])
      @resource.client = @client
      success = @resource.save
    end
    @client.update_attribute(:status_id,params[:status_id]) if params[:status_id].present?
    if success
      @resource = @client.address.present? ? @client.address : Address.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
  end

  def create_addresses
    if @client.address.present?
      @resource = @client.address
      success = @resource.update_attributes(params[:resource])
    else
      @resource = Address.new(params[:resource])
      @resource.client = @client
      success = @resource.save
    end
    if success
      @resource = @client.billing_data.present? ? @client.billing_data : BillingData.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
  end

  def create_billing
    if @client.billing_data.present?
      @resource = @client.billing_data
      success = @resource.update_attributes(params[:resource])
    else
      @resource = BillingData.new(params[:resource])
      @resource.client = @client
      success = @resource.save
    end
    if success
      @resource = @client.client_locations.present? ? @client.client_locations.first : ClientLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
  end

  def create_location
    @resource = ClientLocation.new(params[:resource])
    @resource.client = @client
    success = @resource.save
    if success
      @locations = @client.client_locations
      @resource = ClientLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
  end

  def remove_location
    @loc = ClientLocation.find_by_id(params[:id])
    @locations = @client.client_locations
    if @loc.destroy
      @locations = @client.client_locations
      @resource = ClientLocation.new
    end
    render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
  end

  def jobs_history
    @client = User.find_by_id(params[:id])
    @jobs = @client.requested_jobs
  end

  private

  def set_client
    @client = User.find_by_id(params[:c_id])
  end
  
end
